package org.mokylin.skin.app.dailyTaskEventTrack.trackItem
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_task_tabBar;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TouJingEventTrackSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnReturn:feathers.controls.Button;

		public var hpDi:feathers.controls.UIAsset;

		public var img1:feathers.controls.UIAsset;

		public var imgBar:feathers.controls.UIAsset;

		public var labBelongsCountry:feathers.controls.Label;

		public var labComplete:feathers.controls.Label;

		public var labCountDown:feathers.controls.Label;

		public var labCountryName:feathers.controls.Label;

		public var labDesc:feathers.controls.Label;

		public var labJingShuQuality:feathers.controls.Label;

		public var labJingShuState:feathers.controls.Label;

		public var labMyCountry:feathers.controls.Label;

		public var labQuality:feathers.controls.Label;

		public var labRate:feathers.controls.Label;

		public var labTittle:feathers.controls.Label;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TouJingEventTrackSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 205;
			this.width = 230;
			this.elementsContent = [img1_i(),labDesc_i(),list_i(),labCountDown_i(),labComplete_i(),labBelongsCountry_i(),labJingShuQuality_i(),labQuality_i(),hpDi_i(),imgBar_i(),labRate_i(),btnReturn_i(),labJingShuState_i(),labCountryName_i(),labTittle_i(),labMyCountry_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnReturn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnReturn = temp;
			temp.name = "btnReturn";
			temp.height = 26;
			temp.label = "回本国王城";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_task_tabBar;
			temp.width = 88;
			temp.x = 112;
			temp.y = 139;
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
			temp.x = 105;
			temp.y = 123;
			return temp;
		}

		private function img1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img1 = temp;
			temp.name = "img1";
			temp.height = 205;
			temp.styleName = "ui/common/backgound/sanjimianban.png";
			temp.width = 230;
			temp.x = 0;
			temp.y = 0;
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
			temp.x = 106;
			temp.y = 124;
			return temp;
		}

		private function labBelongsCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBelongsCountry = temp;
			temp.name = "labBelongsCountry";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "经书来源国家：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 105;
			temp.x = 10;
			temp.y = 60;
			return temp;
		}

		private function labComplete_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labComplete = temp;
			temp.name = "labComplete";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "交   任   务：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 105;
			temp.x = 10;
			temp.y = 142;
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
			temp.text = "换取倒计时：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 90;
			temp.x = 10;
			temp.y = 115;
			return temp;
		}

		private function labCountryName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCountryName = temp;
			temp.name = "labCountryName";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "【楚国】";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 120;
			temp.x = 105;
			temp.y = 60;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.fontSize = 14;
			temp.text = "（点击国家名称，可以自动寻路）";
			temp.textAlign = "center";
			temp.color = 0xFF4500;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 228;
			temp.x = 0;
			temp.y = 180;
			return temp;
		}

		private function labJingShuQuality_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labJingShuQuality = temp;
			temp.name = "labJingShuQuality";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "经 书 品 质 ：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 105;
			temp.x = 10;
			temp.y = 88;
			return temp;
		}

		private function labJingShuState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labJingShuState = temp;
			temp.name = "labJingShuState";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "白色";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 120;
			temp.x = 112;
			temp.y = 88;
			return temp;
		}

		private function labMyCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMyCountry = temp;
			temp.name = "labMyCountry";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "本国（$）经书数量：$";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 5;
			temp.y = 55;
			return temp;
		}

		private function labQuality_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labQuality = temp;
			temp.name = "labQuality";
			temp.bold = false;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"CENTER\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#F3E6D4\" LETTERSPACING=\"0\" KERNING=\"0\"><B>荆州：</B></FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "最高品质，不可换取！";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 145;
			temp.x = 90;
			temp.y = 115;
			return temp;
		}

		private function labRate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRate = temp;
			temp.name = "labRate";
			temp.text = "10秒";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 41;
			temp.x = 155;
			temp.y = 115;
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
			temp.text = "各国经书数量";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 230;
			temp.x = 0;
			temp.y = 27;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 125;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin;
			temp.width = 200;
			temp.x = 30;
			temp.y = 80;
			return temp;
		}

	}
}