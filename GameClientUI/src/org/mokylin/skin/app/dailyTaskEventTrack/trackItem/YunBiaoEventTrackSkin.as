package org.mokylin.skin.app.dailyTaskEventTrack.trackItem
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class YunBiaoEventTrackSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnGetOff:feathers.controls.Button;

		public var btnGetOn:feathers.controls.Button;

		public var btnXun:feathers.controls.Button;

		public var hpDi:feathers.controls.UIAsset;

		public var hpDi0:feathers.controls.UIAsset;

		public var img0:feathers.controls.UIAsset;

		public var img1:feathers.controls.UIAsset;

		public var imgBar:feathers.controls.UIAsset;

		public var imgBar0:feathers.controls.UIAsset;

		public var imgJiantou1:feathers.controls.UIAsset;

		public var imgJiantou2:feathers.controls.UIAsset;

		public var imgJiantou3:feathers.controls.UIAsset;

		public var labAnQuan:feathers.controls.Label;

		public var labCountDown:feathers.controls.Label;

		public var labPointComplete:feathers.controls.Label;

		public var labPointRealTime:feathers.controls.Label;

		public var labPointRefresh1:feathers.controls.Label;

		public var labPointRefresh2:feathers.controls.Label;

		public var labQulity:feathers.controls.Label;

		public var labRate:feathers.controls.Label;

		public var labRate0:feathers.controls.Label;

		public var labState:feathers.controls.Label;

		public var labState1:feathers.controls.Label;

		public var labState2:feathers.controls.Label;

		public var labState3:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function YunBiaoEventTrackSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 245;
			this.width = 230;
			this.elementsContent = [img1_i(),img0_i(),labPointRealTime_i(),__YunBiaoEventTrackSkin_Label1_i(),labCountDown_i(),labQulity_i(),labAnQuan_i(),labState_i(),hpDi0_i(),imgBar0_i(),labRate0_i(),hpDi_i(),imgBar_i(),labRate_i(),__YunBiaoEventTrackSkin_Label2_i(),__YunBiaoEventTrackSkin_Label3_i(),__YunBiaoEventTrackSkin_Label4_i(),__YunBiaoEventTrackSkin_Label5_i(),labPointRefresh1_i(),labPointRefresh2_i(),labPointComplete_i(),labState1_i(),labState2_i(),labState3_i(),btnXun_i(),btnGetOff_i(),btnGetOn_i(),imgJiantou1_i(),imgJiantou2_i(),imgJiantou3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __YunBiaoEventTrackSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "运镖任务状况";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 230;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function __YunBiaoEventTrackSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "任务倒计时：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 95;
			temp.x = 5;
			temp.y = 52;
			return temp;
		}

		private function __YunBiaoEventTrackSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "镖车品质：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 81;
			temp.x = 5;
			temp.y = 77;
			return temp;
		}

		private function __YunBiaoEventTrackSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "镖车血量：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 82;
			temp.x = 5;
			temp.y = 102;
			return temp;
		}

		private function __YunBiaoEventTrackSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "当前状态：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 5;
			temp.y = 126;
			return temp;
		}

		private function btnGetOff_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGetOff = temp;
			temp.name = "btnGetOff";
			temp.label = "下车";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.x = 125;
			temp.y = 122;
			return temp;
		}

		private function btnGetOn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGetOn = temp;
			temp.name = "btnGetOn";
			temp.label = "上车";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.x = 125;
			temp.y = 122;
			return temp;
		}

		private function btnXun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnXun = temp;
			temp.name = "btnXun";
			temp.label = "寻回";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.x = 125;
			temp.y = 122;
			return temp;
		}

		private function hpDi0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			hpDi0 = temp;
			temp.name = "hpDi0";
			temp.height = 10;
			temp.styleName = "ui/common/bar/jing_yan_di.jpg";
			temp.width = 120;
			temp.x = 103;
			temp.y = 156;
			return temp;
		}

		private function hpDi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			hpDi = temp;
			temp.name = "hpDi";
			temp.height = 10;
			temp.styleName = "ui/common/bar/jing_yan_di.jpg";
			temp.width = 100;
			temp.x = 75;
			temp.y = 107;
			return temp;
		}

		private function img0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img0 = temp;
			temp.name = "img0";
			temp.height = 173;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 230;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function img1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img1 = temp;
			temp.name = "img1";
			temp.height = 68;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 230;
			temp.x = 0;
			temp.y = 177;
			return temp;
		}

		private function imgBar0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBar0 = temp;
			temp.name = "imgBar0";
			temp.height = 8;
			temp.styleName = "ui/mainui/head/line/xue.png";
			temp.width = 120;
			temp.x = 104;
			temp.y = 157;
			return temp;
		}

		private function imgBar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBar = temp;
			temp.name = "imgBar";
			temp.height = 8;
			temp.styleName = "ui/mainui/head/line/xue.png";
			temp.width = 80;
			temp.x = 76;
			temp.y = 108;
			return temp;
		}

		private function imgJiantou1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJiantou1 = temp;
			temp.name = "imgJiantou1";
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_lv1.png";
			temp.x = 156;
			temp.y = 179;
			return temp;
		}

		private function imgJiantou2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJiantou2 = temp;
			temp.name = "imgJiantou2";
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_lv1.png";
			temp.x = 156;
			temp.y = 199;
			return temp;
		}

		private function imgJiantou3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJiantou3 = temp;
			temp.name = "imgJiantou3";
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_lv1.png";
			temp.x = 156;
			temp.y = 219;
			return temp;
		}

		private function labAnQuan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labAnQuan = temp;
			temp.name = "labAnQuan";
			temp.fontSize = 14;
			temp.text = "安全";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 180;
			temp.y = 102;
			return temp;
		}

		private function labCountDown_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCountDown = temp;
			temp.name = "labCountDown";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "60秒";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 73;
			temp.x = 100;
			temp.y = 53;
			return temp;
		}

		private function labPointComplete_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPointComplete = temp;
			temp.name = "labPointComplete";
			temp.bold = false;
			temp.height = 18;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "边境军需官：";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 110;
			temp.x = 7;
			temp.y = 220;
			return temp;
		}

		private function labPointRealTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPointRealTime = temp;
			temp.name = "labPointRealTime";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "远离";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 50;
			temp.x = 75;
			temp.y = 124;
			return temp;
		}

		private function labPointRefresh1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPointRefresh1 = temp;
			temp.name = "labPointRefresh1";
			temp.bold = false;
			temp.height = 18;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "军需官：";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 110;
			temp.x = 7;
			temp.y = 181;
			return temp;
		}

		private function labPointRefresh2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPointRefresh2 = temp;
			temp.name = "labPointRefresh2";
			temp.bold = false;
			temp.height = 18;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "阳平关军需官：";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 110;
			temp.x = 7;
			temp.y = 200;
			return temp;
		}

		private function labQulity_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labQulity = temp;
			temp.name = "labQulity";
			temp.fontSize = 14;
			temp.text = "橙色";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 100;
			temp.y = 77;
			return temp;
		}

		private function labRate0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRate0 = temp;
			temp.name = "labRate0";
			temp.fontSize = 14;
			temp.text = "10秒";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 41;
			temp.x = 153;
			temp.y = 151;
			return temp;
		}

		private function labRate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRate = temp;
			temp.name = "labRate";
			temp.fontSize = 14;
			temp.text = "80%";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 115;
			temp.y = 102;
			return temp;
		}

		private function labState1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labState1 = temp;
			temp.name = "labState1";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "未验镖";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 110;
			temp.y = 182;
			return temp;
		}

		private function labState2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labState2 = temp;
			temp.name = "labState2";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "未验镖";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 110;
			temp.y = 202;
			return temp;
		}

		private function labState3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labState3 = temp;
			temp.name = "labState3";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "未交付";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 110;
			temp.y = 222;
			return temp;
		}

		private function labState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labState = temp;
			temp.name = "labState";
			temp.bold = false;
			temp.height = 18;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "换镖车倒计时：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 132;
			temp.x = 5;
			temp.y = 150;
			return temp;
		}

	}
}