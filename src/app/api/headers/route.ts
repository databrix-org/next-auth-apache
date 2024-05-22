import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest) {
  const headers = request.headers;
  return NextResponse.json({ headers });
}

export async function POST(request: NextRequest) {
  const headers = request.headers;
  return NextResponse.json({ headers });
}
