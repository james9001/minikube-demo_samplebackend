import express, { Request, Response } from "express";

export const testRouter = express.Router();

testRouter.get("/", async (req: Request, resp: Response) => {

	resp.status(200).send("hello");
});
