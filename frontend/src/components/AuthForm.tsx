import React, { useState, ChangeEvent, FormEvent } from "react";
import { useNavigate } from "react-router-dom";

interface FormData {
  email: string;
  password: string;
  confirmPassword?: string;
}

const AuthForm: React.FC = () => {
  const navigate = useNavigate();
  const [isSignUp, setIsSignUp] = useState<boolean>(false);
  const [formData, setFormData] = useState<FormData>({
    email: "",
    password: "",
    confirmPassword: "",
  });

  const [message, setMessage] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(false);

  const toggleForm = () => {
    setIsSignUp((prev) => !prev);
    setFormData({
      email: "",
      password: "",
      confirmPassword: "",
    });
    setMessage(null);
  };

  const handleChange = (e: ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;

    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (isSignUp && formData.password !== formData.confirmPassword) {
      setMessage("Passwords do not match. Please try again!");

      return;
    }
    const endpoint = isSignUp ? "/signup" : "/signin";
    const body = { email: formData.email, password: formData.password };

    try {
      setLoading(true);
      setMessage(null);

      const response = await fetch(`http://localhost:8001${endpoint}`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      });

      const data = await response.json();

      if (!response.ok) {
        setMessage(data.detail || "Error!!");
      } else {
        setMessage(isSignUp ? "Sign-up successful!" : "Sign-in successful");
        // NEED TO STORE JWT TOKENS
        // data.token -- store it on local or session storage
        
        // Navigate to home page after successful authentication
        setTimeout(() => {
          navigate('/home');
        }, 1500); // Give user time to see success message
      }
    } catch (error) {
      setMessage("Error!!!");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={styles.container}>
      <h2>{isSignUp ? "Sign Up" : "Sign In"}</h2>
      <form style={styles.form} onSubmit={handleSubmit}>
        <input
          required
          name="email"
          placeholder="Email"
          style={styles.input}
          type="email"
          value={formData.email}
          onChange={handleChange}
        />
        <input
          required
          name="password"
          placeholder="Password"
          style={styles.input}
          type="password"
          value={formData.password}
          onChange={handleChange}
        />
        {isSignUp && (
          <input
            required
            name="confirmPassword"
            placeholder="Confirm Password"
            style={styles.input}
            type="password"
            value={formData.confirmPassword || ""}
            onChange={handleChange}
          />
        )}
        <button style={styles.button} type="submit" disabled={loading}>
          {loading ? "Processing..." : isSignUp ? "Sign Up" : "Sign In"}
        </button>
      </form>
      {<p style={styles.message}>{message}</p>}
      <p style={styles.toggleText}>
        {isSignUp ? "Already have an account?" : "Don't have an account?"}{" "}
        <button style={styles.toggleLink} onClick={toggleForm}>
          {isSignUp ? "Sign In" : "Sign Up"}
        </button>
      </p>
    </div>
  );
};

const styles: { [key: string]: React.CSSProperties } = {
  container: {
    maxWidth: "400px",
    margin: "50px auto",
    padding: "20px",
    border: "1px solid #ddd",
    borderRadius: "8px",
    textAlign: "center",
    fontFamily: "Arial, sans-serif",
  },
  form: {
    display: "flex",
    flexDirection: "column",
  },
  input: {
    marginBottom: "15px",
    padding: "10px",
    fontSize: "16px",
    borderRadius: "4px",
    border: "1px solid #ccc",
  },
  button: {
    padding: "10px",
    fontSize: "16px",
    color: "#fff",
    backgroundColor: "#007BFF",
    border: "none",
    borderRadius: "4px",
    cursor: "pointer",
  },
  toggleText: {
    marginTop: "15px",
    fontSize: "14px",
  },
  toggleLink: {
    color: "#007BFF",
    cursor: "pointer",
    textDecoration: "underline",
  },
};

export default AuthForm;
