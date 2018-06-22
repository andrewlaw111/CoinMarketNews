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
    marginVertical: 10,
    marginHorizontal: 15,
    flex: 1,
    borderRadius: 15,
    borderWidth: variables.borderWidth,
    borderColor: variables.cardBorderColor,
    flexWrap: "nowrap",
    backgroundColor: variables.cardDefaultBg,
    padding: 10,
    shadowColor: "#000",
    shadowOffset: { width: 15, height: 15 },
    shadowOpacity: 0.1,
    shadowRadius: 7,
    elevation: 6
  };

  return cardTheme;
};
