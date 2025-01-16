import React, { useState, ChangeEvent, FormEvent } from "react";

interface FormData {
  email: string;
  password: string;
  confirmPassword?: string;
}

const AuthForm: React.FC = () => {
  const [isSignUp, setIsSignUp] = useState<boolean>(false);
  const [formData, setFormData] = useState<FormData>({
    email: "",
    password: "",
    confirmPassword: "",
  });

  const toggleForm = () => {
    setIsSignUp((prev) => !prev);
    setFormData({
      email: "",
      password: "",
      confirmPassword: "",
    });
  };

  const handleChange = (e: ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;

    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (isSignUp) {
      if (formData.password !== formData.confirmPassword) {
        alert("Passwords do not match!");

        return;
      }
      alert("Sign Up Data:");
    } else {
      alert("Sign In Data:");
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
        <button style={styles.button} type="submit">
          {isSignUp ? "Sign Up" : "Sign In"}
        </button>
      </form>
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
