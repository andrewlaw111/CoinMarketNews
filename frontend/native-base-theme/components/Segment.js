import variable from "./../variables/platform";

export default (variables = variable) => {
	const platform = variables.platform;

	const segmentTheme = {
		height: 45,
		borderColor: variables.segmentBorderColorMain,
		flexDirection: "row",
		justifyContent: "center",
		backgroundColor: variables.segmentBackgroundColor,
		"NativeBase.Button": {
			alignSelf: "center",
			borderRadius: 0,
			paddingHorizontal: 20,
			height: 30,
			backgroundColor: "transparent",
			borderWidth: platform === "ios" ? 1 : 2,
			borderLeftWidth: 0,
			borderRightWidth: platform === "ios" ? 1 : 0,
			borderColor: variables.segmentBorderColor,
			elevation: 0,
			".active": {
				backgroundColor: variables.segmentActiveBackgroundColor,
				"NativeBase.Text": {
					color: variables.segmentActiveTextColor,
				},
			},
			".first": {
				borderTopLeftRadius: platform === "ios" ? 5 : 5,
				borderBottomLeftRadius: platform === "ios" ? 5 : 5,
				borderLeftWidth: platform === "ios" ? 1 : 2,
			},
			".last": {
				borderTopRightRadius: platform === "ios" ? 5 : 5,
				borderBottomRightRadius: platform === "ios" ? 5 : 5,
				borderRightWidth: platform === "ios" ? 1 : 2,
			},
			"NativeBase.Text": {
				color: variables.segmentTextColor,
				fontSize: 14,
			},
		},
	};

	return segmentTheme;
};