package com.company.pickers.common;

public class Constant {
	public enum ServiceResult {
        SUCCESS,
        FAIL,
        DUPLICATE,
        NOT_FOUND,
        LEAVE,
        INVALID_TOKEN,
        NOT_MATCH,
        INVALID_PARAM,
        BAD_REQUEST,
        UNAUTHORIZED,
        MAMS_ERROR,
        ALREADY_DATA
    }

	public enum LoginResult {
		SUCCESS,
		NOT_FOUND,
		LEAVE,
		DORMANT,
		BENNED,
		NOT_MATCHE,
		LOGIN_ERROR
	}

	public enum menuCodeType {
		BULLETIN("01"),				// 자유게시판
		WINPRAYER("02"),			// 당첨기원
		DEBATEROOM("03"),  			// 토론방
		THEFIRSTSTORY("04"),		// 당첨자이야기
		NOTICE("11"),				// 공지사항
		MATTERSFORINQUIRY("12"),	// 1:1문의하기
		THISWEEKSNUMBER("21"),		// 이번주 나의번호
		MYLOTTOPAYMENT("22");		// 결제 게시판
		menuCodeType(String type) {
			this.type = type;
		}
		private String type;
		public String getTypeValue() {
			return this.type;
		}
	}

	public static String menuCodeTypeName(String boardType) {
		switch (boardType){
			case "01": return "자유게시판";
			case "02": return "당첨기원게시판";
			case "03": return "토론방";
			case "04": return "1등당첨자이야기";
			case "11": return "공지사항";
			case "12": return "1:1문의하기";
			case "21": return "이번주 나의번호";
			case "22": return "결제 게시판";
			default: return "기타";
		}
	}

	public static String menuCodeTypeGroupName(String boardType) {
		switch (boardType){
			case "01":
			case "02":
			case "03":
			case "04":
				return "커뮤니티";
			case "11":
			case "12":
				return "고객센터";
			case "21":
			case "22":
				return "나의로또";
			default: return "기타";
		}
	}

	public enum membershipCode{
		RECOMMEND("01", "추천"),		// 자유게시판
		FIXEDTERM_DISCOUNT("02", "기간제할인"),  		// 토론방
		EVENT_DISCOUNT("03", "이벤트 할인"),		//
		BONUS("04", "보너스 조합");
		membershipCode(String type, String title) {
			this.type = type;
			this.title = title;
		}
		private String type;
		private String title;
		public String getTypeValue() {
			return this.type;
		}
		public String getTitleValue() {
			return this.title;
		}
	}

	public static String SnsType(String SnsType) {
		switch (SnsType){
			case "kakao": return "02";
			case "naver": return "03";
			case "google": return "04";
			case "facebook": return "05";
			default: return "01";
		}
	}
}
