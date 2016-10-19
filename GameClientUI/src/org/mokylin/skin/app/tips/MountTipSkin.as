package org.mokylin.skin.app.tips
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
	public class MountTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var groupTitle:feathers.controls.Group;

		public var imgBG:feathers.controls.UIAsset;

		public var imgIcon:feathers.controls.UIAsset;

		public var labDesc:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labType:feathers.controls.Label;

		public var line0:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 380;
			this.width = 245;
			this.elementsContent = [imgBG_i(),line0_i(),groupTitle_i(),labDesc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountTipSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang.png";
			temp.x = 16;
			temp.y = 13;
			return temp;
		}

		private function groupTitle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupTitle = temp;
			temp.name = "groupTitle";
			temp.height = 70;
			temp.width = 230;
			temp.x = 8;
			temp.y = 8;
			temp.elementsContent = [__MountTipSkin_UIAsset1_i(),imgIcon_i(),labName_i(),labType_i()];
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 372;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIcon = temp;
			temp.name = "imgIcon";
			temp.height = 46;
			temp.width = 46;
			temp.x = 19;
			temp.y = 16;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.height = 18;
			temp.leading = 5;
			temp.text = "寿命：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 230;
			temp.x = 8;
			temp.y = 90;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.height = 20;
			temp.fontSize = 16;
			temp.color = 0xE530EC;
			temp.width = 157;
			temp.x = 73;
			temp.y = 18;
			return temp;
		}

		private function labType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labType = temp;
			temp.name = "labType";
			temp.bold = true;
			temp.height = 20;
			temp.fontSize = 14;
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 157;
			temp.x = 73;
			temp.y = 43;
			return temp;
		}

		private function line0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line0 = temp;
			temp.name = "line0";
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 231;
			temp.x = 7;
			temp.y = 83;
			return temp;
		}

	}
}