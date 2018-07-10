// Feature to be Added
{/* <View>
    <View style={{ flexDirection: "row", justifyContent: "center", alignItems: "center", backgroundColor: (this.props.appSettings.darkMode) ? "#343a44" : "#F8F8F8", height: 50, }}>
        <TextInput
            style={{ flex: 0.95, backgroundColor: "#FFFFFF", borderColor: 'gray', borderWidth: 1, borderRadius: 7, height: 40, }}
            clearButtonMode={"always"}
            onChangeText={this.onChangeTextHandler}
            onFocus={this.onFocusHandler}
            onBlur={this.onBlurHandler}
            underlineColorAndroid="transparent"
            placeholder="Search"
            ref={input => { this.textInput = input }}
        // value={this.state.text}
        />
        <TouchableOpacity style={{ marginLeft: 5 }} onPress={this.onPressCancel}>{(this.state.showCancel) ? <Text>Cancel</Text> : null}</TouchableOpacity>
    </View>
    <View style={{ height: (this.state.searching) ? this.windowHeight - 227 : 0 }}>
        <FlatList
            data={this.state.searchedCoins}
            extraData={this.props.favourites}
            initialNumToRender={15}
            renderItem={this.renderCoinList}
            keyExtractor={this.keyExtractor}
            style={[styles(this.props.appSettings.darkMode).coinList,]}
            getItemLayout={this.getItemLayout}
        />
    </View>
</View >
 private onBlurHandler = () => {
    if (this.state.searchedCoins.length > 0) {
        return
    } else {
        this.textInput.clear()
        this.setState({
            showCancel: false
        }, () => {
            if (Platform.OS === "android") {
                UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
            }
            let animationConfig = { ...LayoutAnimation.Presets.spring };
            animationConfig.duration = 720;

            LayoutAnimation.configureNext(animationConfig);

            this.setState({
                searching: false
            })
        })
    }
}
    private onChangeTextHandler = (searchInput: string) => {
    this.searchInput = searchInput;
    if (searchInput.length > 1) {
        if (searchInput.length > 2 && this.state.searchedCoins.length === 0) {
            return
        } else {
            axios
                .get<ICoinPrice[]>(
                    `${Config.API_SERVER}/price/search`,
                    {
                        headers: {
                            token: this.props.user.token,
                            searchInput: searchInput,
                            fiat: this.state.fiatCurrencyName,
                            crypto: this.state.cryptoCurrencyName,
                        }
                    }
                )
                .then((response) => {
                    if (this.searchInput.length > 1) {
                        this.setState({
                            searchedCoins: response.data
                        });
                    }
                });
        }
    } else {
        this.setState({
            searchedCoins: []
        });
    }
}
    private onFocusHandler = () => {
    this.setState({
        showCancel: true
    }, () => {
        if (Platform.OS === "android") {
            UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
        }

        let animationConfig = { ...LayoutAnimation.Presets.easeInEaseOut };
        animationConfig.duration = 400;

        LayoutAnimation.configureNext(animationConfig);

        this.setState({
            searching: true
        })
    })

}
    private onPressCancel = () => {
    this.setState({
        searchedCoins: []
    }, () => {
        this.textInput.clear();
        this.textInput.blur();
        this.onBlurHandler();
    })
}
    private onScroll = (event: NativeSyntheticEvent<NativeScrollEvent>) => {
    if (Platform.OS === "android") {
        UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
    }

    if (this.offset - event.nativeEvent.contentOffset.y > 5) {
        LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);
        this.setState({
            showSearch: true
        })
    } else if (event.nativeEvent.contentOffset.y - this.offset > 30) {
        LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);
        this.setState({
            showSearch: false
        })
    }
    this.offset = event.nativeEvent.contentOffset.y
} */}