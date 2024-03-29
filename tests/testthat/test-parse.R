context("Parser")

test_that("parse_unit works as expected", {

  expect_identical(
    parse_unit(c("1.2s", "1.2 s", "1.2S",  "1.2 secs", " 1.2  seco", " 1.2 seconds ")),
    list(n = rep.int(1.2, 6),
         unit = rep.int("second", 6)))

  expect_identical(
    parse_unit(c("1M", "1 mi", "mi",  "1 mins", " 1  minu", " minutes ")),
    list(n = rep.int(1, 6),
         unit = rep.int("minute", 6)))

  expect_identical(
    parse_unit(c("-1M", "-.1 d", "-1000.0000001y", "-1000.0000001years")),
    list(n = c(-1, -.1, -1000.0000001, -1000.0000001),
         unit = c("minute", "day", "year", "year")))

  expect_identical(
    parse_unit(c("-1sea", "-.1 seaso", "-1000.0000001seasons ")),
    list(n = c(-1, -.1, -1000.0000001),
         unit = c("season", "season", "season")))

  expect_identical(
    parse_unit(c("-1h", "-.1ha", "-1000.0000001se", "-1000.0000001sea")),
    list(n = c(-1, -.1, -1000.0000001, -1000.0000001),
         unit = c("hour", "halfyear", "second", "season")))

  expect_identical(parse_unit("asecs"), list(n = 1, unit = "asecond"))
  expect_identical(parse_unit("102.300003 amins"), list(n = 102.300003, unit = "aminute"))
  expect_identical(parse_unit("ahours"), list(n = 1, unit = "ahour"))
  expect_identical(parse_unit("2.3 ahours"), list(n = 2.3, unit = "ahour"))

  expect_identical(parse_unit("as"), list(n = 1, unit = "asecond"))
  expect_identical(parse_unit("am"), list(n = 1, unit = "aminute"))
  expect_identical(parse_unit("ah"), list(n = 1, unit = "ahour"))

  expect_identical(parse_unit("0H 3M 0S"), list(n = 3, unit = "minute"))
  expect_identical(parse_unit("3M 0S 0mon"), list(n = 3, unit = "minute"))
})

test_that("parse_unit errors on invalid unit", {
  expect_error(parse_unit("1 blabla"), "Invalid unit.*blabla")
  expect_error(parse_unit("1 mm"), "Invalid unit.*mm")
  expect_error(parse_unit("1"), "Invalid unit.*1")
  expect_error(parse_unit("1 2"), "Invalid unit.*1 2")
  expect_error(parse_unit("1 m m"), "Heterogeneous unit.*m m")
  expect_error(parse_unit("3M 0S 1M"), "Heterogeneous unit.*1M")
})
