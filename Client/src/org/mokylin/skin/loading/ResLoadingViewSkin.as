package org.mokylin.skin.loading
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ResLoadingViewSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var barGroup:feathers.controls.Group;

		public var barHead:feathers.controls.UIAsset;

		public var barLine:feathers.controls.UIAsset;

		public var bgImage:feathers.controls.UIAsset;

		public var bottomInfo:feathers.controls.Label;

		public var healthInfoGroup:feathers.controls.Group;

		public var healthInfoTxt1:feathers.controls.Label;

		public var healthInfoTxt2:feathers.controls.Label;

		public var infoTxt:feathers.controls.Label;

		public var leftTxtGroup:feathers.controls.Group;

		public var progressTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ResLoadingViewSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 924;
			this.width = 1643;
			this.elementsContent = [bgImage_i(),barGroup_i(),bottomInfo_i(),healthInfoGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ResLoadingViewSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.text = "首次加载将会需要较多时间，请耐心等待";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 260;
			temp.x = 714;
			temp.y = 22;
			return temp;
		}

		private function barGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			barGroup = temp;
			temp.name = "barGroup";
			temp.x = -24;
			temp.y = 816;
			temp.elementsContent = [barLine_i(),barHead_i(),leftTxtGroup_i(),__ResLoadingViewSkin_Label1_i()];
			return temp;
		}

		private function barHead_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			barHead = temp;
			temp.name = "barHead";
			temp.height = 25;
			temp.styleName = "ui/loading/liangdian.png";
			temp.width = 38;
			temp.x = 0;
			temp.y = 44;
			return temp;
		}

		private function barLine_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			barLine = temp;
			temp.name = "barLine";
			temp.height = 9;
			temp.styleName = "ui/loading/jindutiao.png";
			temp.width = 1643;
			temp.x = 24;
			temp.y = 53;
			return temp;
		}

		private function bgImage_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgImage = temp;
			temp.name = "bgImage";
			temp.height = 924;
			temp.styleName = "ui/big_bg/lanch_ditu.jpg";
			temp.width = 1643;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bottomInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bottomInfo = temp;
			temp.name = "bottomInfo";
			temp.height = 24;
			temp.text = "抵制不良游戏，拒绝盗版游戏。注意自我保护，谨防受骗上当。适度游戏益脑，沉迷游戏伤身。合理安排时间，享受健康生活。";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 850;
			temp.x = 400;
			temp.y = 885;
			return temp;
		}

		private function healthInfoGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			healthInfoGroup = temp;
			temp.name = "healthInfoGroup";
			temp.x = 424;
			temp.y = 200;
			temp.elementsContent = [healthInfoTxt2_i(),healthInfoTxt1_i()];
			return temp;
		}

		private function healthInfoTxt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			healthInfoTxt1 = temp;
			temp.name = "healthInfoTxt1";
			temp.height = 46;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.letterSpacing = 5;
			temp.fontSize = 36;
			temp.text = "健康游戏忠告";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 800;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function healthInfoTxt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			healthInfoTxt2 = temp;
			temp.name = "healthInfoTxt2";
			temp.height = 298;
			temp.htmlText = "抵制不良游戏，拒绝盗版游戏<br>注意自我保护，谨防受骗上当<br>适度游戏益脑，沉迷游戏伤身<br>合理安排时间，享受健康生活";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.leading = 10;
			temp.letterSpacing = 5;
			temp.fontSize = 36;
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 800;
			temp.x = 0;
			temp.y = 90;
			return temp;
		}

		private function infoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt = temp;
			temp.name = "infoTxt";
			temp.bold = true;
			temp.height = 22;
			temp.text = "信息提示...";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 700;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function leftTxtGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			leftTxtGroup = temp;
			temp.name = "leftTxtGroup";
			temp.x = 38;
			temp.y = 0;
			temp.elementsContent = [progressTxt_i(),infoTxt_i()];
			return temp;
		}

		private function progressTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			progressTxt = temp;
			temp.name = "progressTxt";
			temp.bold = true;
			temp.height = 22;
			temp.text = "总进度：50%";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

	}
}