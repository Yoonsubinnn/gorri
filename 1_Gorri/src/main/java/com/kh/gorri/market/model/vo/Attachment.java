package com.kh.gorri.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Attachment {
	private int attmId;
	private String savePath;
	private String originalName;
	private String renameName;
	private String boardType;
	private int boardNO;
	private int attmLevel;
	private String userId;
}
