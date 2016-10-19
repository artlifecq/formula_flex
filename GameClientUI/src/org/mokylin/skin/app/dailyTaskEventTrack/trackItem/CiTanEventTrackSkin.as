package org.mokylin.skin.app.dailyTaskEventTrack.trackItem
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.tabbar.TabBarSkin_task_tabBar;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CiTanEventTrackSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnGiveUp:feathers.controls.Button;

		public var btnReturn:feathers.controls.Button;

		public var hpDi:feathers.controls.UIAsset;

		public var img0:feathers.controls.UIAsset;

		public var img1:feathers.controls.UIAsset;

		public var imgBar:feathers.controls.UIAsset;

		public var labCountDown:feathers.controls.Label;

		public var labDesc:feathers.controls.Label;

		public var labMiXinQulity:feathers.controls.Label;

		public var labPoint1:feathers.controls.Label;

		public var labPoint2:feathers.controls.Label;

		public var labRate:feathers.controls.Label;

		public var labTittle:feathers.controls.Label;

		public var labTxt1:feathers.controls.Label;

		public var labTxt2:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CiTanEventTrackSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 205;
			this.width = 230;
			this.elementsContent = [img1_i(),img0_i(),btnReturn_i(),__CiTanEventTrackSkin_Label1_i(),__CiTanEventTrackSkin_Label2_i(),labTxt1_i(),labTxt2_i(),labMiXinQulity_i(),labCountDown_i(),hpDi_i(),imgBar_i(),labRate_i(),labPoint1_i(),labPoint2_i(),btnGiveUp_i(),labTittle_i(),labDesc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CiTanEventTrackSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "鸡毛信品质：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 110;
			temp.x = 5;
			temp.y = 97;
			return temp;
		}

		private function __CiTanEventTrackSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "换信倒计时：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 110;
			temp.x = 5;
			temp.y = 120;
			return temp;
		}

		private function btnGiveUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGiveUp = temp;
			temp.name = "btnGiveUp";
			temp.height = 26;
			temp.label = "放弃任务";
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_task_tabBar;
			temp.width = 61;
			temp.x = 153;
			temp.y = 97;
			return temp;
		}

		private function btnReturn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnReturn = temp;
			temp.name = "btnReturn";
			temp.height = 26;
			temp.label = "回本国王城";
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_task_tabBar;
			temp.width = 72;
			temp.x = 86;
			temp.y = 157;
			return temp;
		}

		private function hpDi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			hpDi = temp;
			temp.name = "hpDi";
			temp.height = 10;
			temp.styleName = "ui/common/bar/jing_yan_di.jpg";
			temp.width = 120;
			temp.x = 94;
			temp.y = 128;
			return temp;
		}

		private function img0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img0 = temp;
			temp.name = "img0";
			temp.height = 147;
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
			temp.height = 54;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 230;
			temp.x = 0;
			temp.y = 150;
			return temp;
		}

		private function imgBar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBar = temp;
			temp.name = "imgBar";
			temp.height = 8;
			temp.styleName = "ui/mainui/head/line/xue.png";
			temp.width = 120;
			temp.x = 95;
			temp.y = 129;
			return temp;
		}

		private function labCountDown_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCountDown = temp;
			temp.name = "labCountDown";
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "最高品质，不可换取！";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 144;
			temp.x = 85;
			temp.y = 120;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.leading = 2;
			temp.fontSize = 14;
			temp.text = "提示：点击\"狗娃\"自动寻路找到目标";
			temp.textAlign = "center";
			temp.color = 0xFF4500;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 235;
			temp.x = 0;
			temp.y = 180;
			return temp;
		}

		private function labMiXinQulity_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMiXinQulity = temp;
			temp.name = "labMiXinQulity";
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "橙色";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 50;
			temp.x = 95;
			temp.y = 97;
			return temp;
		}

		private function labPoint1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPoint1 = temp;
			temp.name = "labPoint1";
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "0,0";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 135;
			temp.x = 90;
			temp.y = 53;
			return temp;
		}

		private function labPoint2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPoint2 = temp;
			temp.name = "labPoint2";
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"12\" COLOR=\"#4EFD6F\" LETTERSPACING=\"0\" KERNING=\"0\"><U>0,0</U></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "0,0";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 135;
			temp.x = 90;
			temp.y = 73;
			return temp;
		}

		private function labRate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRate = temp;
			temp.name = "labRate";
			temp.text = "10秒";
			temp.width = 41;
			temp.x = 144;
			temp.y = 124;
			return temp;
		}

		private function labTittle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTittle = temp;
			temp.name = "labTittle";
			temp.bold = true;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "鸡毛信任务状况";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 230;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function labTxt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTxt1 = temp;
			temp.name = "labTxt1";
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "取鸡毛信：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 100;
			temp.x = 5;
			temp.y = 55;
			return temp;
		}

		private function labTxt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTxt2 = temp;
			temp.name = "labTxt2";
			temp.bold = false;
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "取鸡毛信：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 100;
			temp.x = 5;
			temp.y = 75;
			return temp;
		}

	}
}