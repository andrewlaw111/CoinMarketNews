interface IDisplayOptions {
    [key: string]: (setting: string) => string;
}

const displayOptions: IDisplayOptions = {
    Cap: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[0] = "0"
        return newSetting.join("")
    },
    Gain: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[0] = "1"
        return newSetting.join("")
    },
    Drop: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[0] = "2"
        return newSetting.join("")
    },
    Fiat: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[1] = "0"
        return newSetting.join("")
    },
    Crypto: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[1] = "1"
        return newSetting.join("")
    },
    oneWeek: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[2] = "0"
        return newSetting.join("")
    },
    oneDay: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[2] = "1"
        return newSetting.join("")
    },
    oneHour: (setting: string) => {
        let newSetting = setting.split("");
        newSetting[2] = "2"
        return newSetting.join("")
    },
};

const getSettingID = (options: string, setting: string) => {
    const newSettings = displayOptions[options](setting);
    return newSettings
};

export default getSettingID