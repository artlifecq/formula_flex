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
	public class MountSpellTipSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var groupTitle:feathers.controls.Group;

		public var imgBG:feathers.controls.UIAsset;

		public var imgChar:feathers.controls.UIAsset;

		public var imgIcon:feathers.controls.UIAsset;

		public var imgSpellType:feathers.controls.UIAsset;

		public var labCurNeedLevel:feathers.controls.Label;

		public var labDesc:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var line0:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountSpellTipSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 180;
			this.width = 270;
			this.elementsContent = [imgBG_i(),labCurNeedLevel_i(),labDesc_i(),groupTitle_i(),line0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountSpellTipSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_46_4.png";
			temp.x = 0;
			temp.y = 10;
			return temp;
		}

		private function groupTitle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupTitle = temp;
			temp.name = "groupTitle";
			temp.height = 70;
			temp.width = 249;
			temp.x = 15;
			temp.y = 8;
			temp.elementsContent = [__MountSpellTipSkin_UIAsset1_i(),imgIcon_i(),imgSpellType_i(),imgChar_i(),labName_i()];
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 180;
			temp.styleName = "ui/common/tip/tips_di.png";
			temp.width = 270;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgChar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgChar = temp;
			temp.name = "imgChar";
			temp.styleName = "ui/app/mount/char/bei_dong.png";
			temp.x = 215;
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
			temp.x = 6;
			temp.y = 16;
			return temp;
		}

		private function imgSpellType_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSpellType = temp;
			temp.name = "imgSpellType";
			temp.height = 43;
			temp.styleName = "ui/common/version_3/B_bujian/hong_3_jiao.png";
			temp.width = 55;
			temp.x = 193;
			temp.y = 0;
			return temp;
		}

		private function labCurNeedLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurNeedLevel = temp;
			temp.name = "labCurNeedLevel";
			temp.text = "技能效果：";
			temp.color = 0x4EFD6F;
			temp.width = 178;
			temp.x = 15;
			temp.y = 90;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.height = 60;
			temp.leading = 5;
			temp.text = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 242;
			temp.x = 13;
			temp.y = 111;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 16;
			temp.text = "坐骑·勇猛（初级）";
			temp.color = 0xE530EC;
			temp.width = 177;
			temp.x = 65;
			temp.y = 20;
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