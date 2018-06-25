import variable from "./../variables/platform";

export default (variables = variable) => {
  const cardTheme = {
    ".transparent": {
      shadowColor: null,
      shadowOffset: null,
      shadowOpacity: null,
      shadowRadius: null,
      elevation: null
    },
    ".noShadow": {
      shadowColor: null,
      shadowOffset: null,
      shadowOpacity: null,
      elevation: null
    },
    marginVertical: 7,
    marginHorizontal: 5,
    flex: 1,
    borderRadius: 10,
    borderWidth: variables.borderWidth,
    borderColor: variables.cardBorderColor,
    flexWrap: "nowrap",
    backgroundColor: variables.cardDefaultBg,
    padding: 6,
    shadowColor: "#000",
    shadowOffset: { width: 15, height: 15 },
    shadowOpacity: 0.1,
    shadowRadius: 7,
    elevation: 3
  };

  return cardTheme;
};
