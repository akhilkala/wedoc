import express from "express";
import dotenv from "dotenv";
import cors from "cors";

import connectDB from "./utils/db";

const app = express();
dotenv.config();
app.use(cors());
connectDB();

app.listen(process.env.PORT, () =>
  console.log(`Server running on port ${process.env.PORT}...`)
);
