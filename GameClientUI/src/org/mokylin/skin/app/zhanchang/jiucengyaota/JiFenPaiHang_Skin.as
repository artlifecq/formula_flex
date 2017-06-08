package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiFenPaiHang_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var grpMy:feathers.controls.Group;

		public var grpTitle:feathers.controls.Group;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var lbHeadName:feathers.controls.Label;

		public var ui_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiFenPaiHang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 446;
			this.width = 281;
			this.elementsContent = [ui_bg_i(),grpTitle_i(),__JiFenPaiHang_Skin_Group1_i(),grpMy_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiFenPaiHang_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 10;
			temp.y = 36;
			temp.elementsContent = [__JiFenPaiHang_Skin_UIAsset2_i(),__JiFenPaiHang_Skin_UIAsset3_i(),__JiFenPaiHang_Skin_UIAsset4_i(),__JiFenPaiHang_Skin_UIAsset5_i()];
			return temp;
		}

		private function __JiFenPaiHang_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/title_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiFenPaiHang_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/zhanchang/jiucengyaota/paihangdi.png";
			temp.width = 260;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiFenPaiHang_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/paiming.png";
			temp.x = 11;
			temp.y = 5;
			return temp;
		}

		private function __JiFenPaiHang_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/mingzi.png";
			temp.x = 106;
			temp.y = 5;
			return temp;
		}

		private function __JiFenPaiHang_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/jifen.png";
			temp.x = 214;
			temp.y = 5;
			return temp;
		}

		private function __JiFenPaiHang_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/zhanchang/jiucengyaota/paihangdi.png";
			temp.width = 260;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiFenPaiHang_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/wodepaiming.png";
			temp.x = 102;
			temp.y = 5;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 258;
			temp.y = 9;
			return temp;
		}

		private function grpMy_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpMy = temp;
			temp.name = "grpMy";
			temp.x = 10;
			temp.y = 376;
			temp.elementsContent = [__JiFenPaiHang_Skin_UIAsset6_i(),__JiFenPaiHang_Skin_UIAsset7_i()];
			return temp;
		}

		private function grpTitle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTitle = temp;
			temp.name = "grpTitle";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__JiFenPaiHang_Skin_UIAsset1_i(),lbHeadName_i(),head_left_i(),head_right_i(),btnClose_i()];
			return temp;
		}

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 49;
			temp.y = 12;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 232;
			temp.y = 12;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "积分排行榜";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.x = 98;
			temp.y = 6;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 446;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 281;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}