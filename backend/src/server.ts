import dotenv from "dotenv";

dotenv.config();

import app from "./app.js";
import connectDB from "./lib/db.js";

const PORT = Number(process.env.PORT) || 5004;

app.listen(PORT, "0.0.0.0", async () => {
  await connectDB();
  console.log(`Server running on port ${PORT}`);
});