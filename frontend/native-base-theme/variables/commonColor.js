import color from "color";

import { Platform, Dimensions, PixelRatio } from "react-native";

const deviceHeight = Dimensions.get("window").height;
const deviceWidth = Dimensions.get("window").width;
const platform = Platform.OS;
const platformStyle = undefined;
const isIphoneX =
  platform === "ios" && deviceHeight === 812 && deviceWidth === 375;

export default {
  platformStyle,
  platform,

  //Android
  androidRipple: true,
  androidRippleColor: "rgba(256, 256, 256, 0.3)",
  androidRippleColorDark: "rgba(0, 0, 0, 0.15)",
  btnUppercaseAndroidText: true,

  // Badge
  badgeBg: "#ED1727",
  badgeColor: "#F8F8F8",
  badgePadding: platform === "ios" ? 3 : 0,

  // Button
  btnFontFamily: platform === "ios" ? "System" : "Roboto_medium",
  btnDisabledBg: "#b5b5b5",
  buttonPadding: 6,
  get btnPrimaryBg() {
    return this.brandPrimary;
  },
  get btnPrimaryColor() {
    return this.inverseTextColor;
  },
  get btnInfoBg() {
    return this.brandInfo;
  },
  get btnInfoColor() {
    return this.inverseTextColor;
  },
  get btnSuccessBg() {
    return this.brandSuccess;
  },
  get btnSuccessColor() {
    return this.inverseTextColor;
  },
  get btnDangerBg() {
    return this.brandDanger;
  },
  get btnDangerColor() {
    return this.inverseTextColor;
  },
  get btnWarningBg() {
    return this.brandWarning;
  },
  get btnWarningColor() {
    return this.inverseTextColor;
  },
  get btnTextSize() {
    return platform === "ios" ? this.fontSizeBase * 1.1 : this.fontSizeBase - 1;
  },
  get btnTextSizeLarge() {
    return this.fontSizeBase * 1.5;
  },
  get btnTextSizeSmall() {
    return this.fontSizeBase * 0.8;
  },
  get borderRadiusLarge() {
    return this.fontSizeBase * 3.8;
  },
  get iconSizeLarge() {
    return this.iconFontSize * 1.5;
  },
  get iconSizeSmall() {
    return this.iconFontSize * 0.6;
  },

  // Card
  cardDefaultBg: "#FFF",
  cardBorderColor: "#ccc",

  // CheckBox
  CheckboxRadius: platform === "ios" ? 13 : 0,
  CheckboxBorderWidth: platform === "ios" ? 1 : 2,
  CheckboxPaddingLeft: platform === "ios" ? 4 : 2,
  CheckboxPaddingBottom: platform === "ios" ? 0 : 5,
  CheckboxIconSize: platform === "ios" ? 21 : 16,
  CheckboxIconMarginTop: platform === "ios" ? undefined : 1,
  CheckboxFontSize: platform === "ios" ? 23 / 0.9 : 17,
  checkboxBgColor: "#039BE5",
  checkboxSize: 20,
  checkboxTickColor: "#F8F8F8",

  // Color
  brandPrimary: platform === "ios" ? "#007aff" : "#2f343f",
  brandInfo: "#62B1F6",
  brandSuccess: "#5cb85c",
  brandDanger: "#d9534f",
  brandWarning: "#f0ad4e",
  brandDark: "#000",
  brandLight: "#f4f4f4",

  // Font
  DefaultFontSize: 16,
  fontFamily: platform === "ios" ? "System" : "Roboto",
  fontSizeBase: 15,
  get fontSizeH1() {
    return this.fontSizeBase * 1.8;
  },
  get fontSizeH2() {
    return this.fontSizeBase * 1.6;
  },
  get fontSizeH3() {
    return this.fontSizeBase * 1.4;
  },

  // Footer
  footerHeight: isIphoneX ? 89 : 55,
  footerDefaultBg: platform === "ios" ? "#F8F8F8" : "#2f343f",
  footerPaddingBottom: isIphoneX ? 34 : 0,

  // FooterTab
  tabBarTextColor: platform === "ios" ? "#737373" : "#bfc6ea",
  tabBarTextSize: platform === "ios" ? 14 : 11,
  activeTab: platform === "ios" ? "#007aff" : "#F8F8F8",
  sTabBarActiveTextColor: "#007aff",
  tabBarActiveTextColor: platform === "ios" ? "#2874F0" : "#F8F8F8",
  tabActiveBgColor: platform === "ios" ? "#cde1f9" : "#2f343f",

  // Header
  toolbarBtnColor: platform === "ios" ? "#007aff" : "#F8F8F8",
  toolbarDefaultBg: platform === "ios" ? "#F8F8F8" : "#2f343f",
  toolbarHeight: platform === "ios" ? (isIphoneX ? 88 : 64) : 56,
  toolbarSearchIconSize: platform === "ios" ? 20 : 23,
  toolbarInputColor: platform === "ios" ? "#CECDD2" : "#F8F8F8",
  searchBarHeight: platform === "ios" ? 30 : 40,
  searchBarInputHeight: platform === "ios" ? 30 : 50,
  toolbarBtnTextColor: platform === "ios" ? "#007aff" : "#F8F8F8",
  iosStatusbar: "dark-content",
  toolbarDefaultBorder: platform === "ios" ? "#a7a6ab" : "#2f343f",
  get statusBarColor() {
    return color(this.toolbarDefaultBg)
      .darken(0.2)
      .hex();
  },
  get darkenHeader() {
    return color(this.tabBgColor)
      .darken(0.03)
      .hex();
  },

  // Icon
  iconFamily: "Ionicons",
  iconFontSize: platform === "ios" ? 30 : 28,
  iconHeaderSize: platform === "ios" ? 33 : 24,

  // InputGroup
  inputFontSize: 17,
  inputBorderColor: "#D9D5DC",
  inputSuccessBorderColor: "#2b8339",
  inputErrorBorderColor: "#ed2f2f",
  inputHeightBase: 50,
  get inputColor() {
    return this.textColor;
  },
  get inputColorPlaceholder() {
    return "#575757";
  },

  // Line Height
  btnLineHeight: 19,
  lineHeightH1: 32,
  lineHeightH2: 27,
  lineHeightH3: 22,
  lineHeight: platform === "ios" ? 20 : 24,

  // List
  listBg: "transparent",
  listBorderColor: "#c9c9c9",
  listDividerBg: "#f4f4f4",
  listBtnUnderlayColor: "#DDD",
  listItemPadding: platform === "ios" ? 10 : 12,
  listNoteColor: "#808080",
  listNoteSize: 13,
  listItemSelected: platform === "ios" ? "#007aff" : "#2f343f",

  // Progress Bar
  defaultProgressColor: "#E4202D",
  inverseProgressColor: "#1A191B",

  // Radio Button
  radioBtnSize: platform === "ios" ? 25 : 23,
  radioSelectedColorAndroid: "#2f343f",
  radioBtnLineHeight: platform === "ios" ? 29 : 24,
  get radioColor() {
    return this.brandPrimary;
  },

  // Segment
  segmentBackgroundColor: platform === "ios" ? "#F8F8F8" : "#2f343f",
  segmentActiveBackgroundColor: platform === "ios" ? "#007aff" : "#F8F8F8",
  segmentTextColor: platform === "ios" ? "#007aff" : "#F8F8F8",
  segmentActiveTextColor: platform === "ios" ? "#F8F8F8" : "#2f343f",
  segmentBorderColor: platform === "ios" ? "#007aff" : "#F8F8F8",
  segmentBorderColorMain: platform === "ios" ? "#a7a6ab" : "#2f343f",
  
  // Spinner
  defaultSpinnerColor: "#3f78ba",
  inverseSpinnerColor: "#3f78ba",

  // Tab
  tabDefaultBg: platform === "ios" ? "#F8F8F8" : "#2f343f",
  topTabBarTextColor: platform === "ios" ? "#6b6b6b" : "#aaa",
  topTabBarActiveTextColor: platform === "ios" ? "#007aff" : "#F8F8F8",
  topTabBarBorderColor: platform === "ios" ? "#a7a6ab" : "#F8F8F8",
  topTabBarActiveBorderColor: platform === "ios" ? "#007aff" : "#3f78ba",

  // Tabs
  tabBgColor: "#F8F8F8",
  tabFontSize: 15,

  // Text
  textColor: "#000",
  inverseTextColor: "#F8F8F8",
  noteFontSize: 14,
  get defaultTextColor() {
    return this.textColor;
  },

  // Title
  titleFontfamily: platform === "ios" ? "System" : "Roboto_medium",
  titleFontSize: platform === "ios" ? 17 : 19,
  subTitleFontSize: platform === "ios" ? 11 : 14,
  subtitleColor: platform === "ios" ? "#000" : "#F8F8F8",
  titleFontColor: platform === "ios" ? "#000" : "#F8F8F8",

  // Other
  borderRadiusBase: platform === "ios" ? 5 : 2,
  borderWidth: 1 / PixelRatio.getPixelSizeForLayoutSize(1),
  contentPadding: 10,
  dropdownLinkColor: "#414142",
  inputLineHeight: 24,
  deviceWidth,
  deviceHeight,
  isIphoneX,
  inputGroupRoundedBorderRadius: 30
};
