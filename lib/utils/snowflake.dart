class Snowflake {
  static timestamp(BigInt snowflake) =>
      (snowflake >> 22) + BigInt.from(DateTime(2024, 1, 1).millisecondsSinceEpoch);
}
