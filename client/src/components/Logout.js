"use client";

import { useRouter } from "next/navigation";

const LogoutButton = () => {
  const router = useRouter();
  const handleLogout = async () => {
    const token =
      localStorage.getItem("access_token") ||
      sessionStorage.getItem("access_token");

    const response = await fetch("http://localhost:4000/auth/logout", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
    });

    if (response.ok) {
      localStorage.removeItem("access_token") ||
        sessionStorage.removeItem("access_token");
      router.push("/");
    } else {
      // handle logout error
    }
  };

  return (
    <div className="p-2 bg-red-300 rounded-full hover:bg-red-500 text-center">
      <button onClick={handleLogout}>Logout</button>
    </div>
  );
};

export default LogoutButton;
