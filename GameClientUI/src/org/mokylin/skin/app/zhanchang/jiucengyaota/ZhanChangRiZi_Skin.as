package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.Flip3_Skin;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhanChangRiZi_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var skinFlip:feathers.controls.SkinnableContainer;

		public var title:feathers.controls.UIAsset;

		public var uiNo:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanChangRiZi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 437;
			this.width = 421;
			this.elementsContent = [bg_i(),__ZhanChangRiZi_Skin_UIAsset1_i(),btnClose_i(),__ZhanChangRiZi_Skin_Group1_i(),skinFlip_i(),uiNo_i(),title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhanChangRiZi_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 41;
			temp.elementsContent = [__ZhanChangRiZi_Skin_UIAsset2_i(),__ZhanChangRiZi_Skin_UIAsset3_i(),__ZhanChangRiZi_Skin_UIAsset4_i(),__ZhanChangRiZi_Skin_UIAsset5_i(),__ZhanChangRiZi_Skin_UIAsset6_i(),__ZhanChangRiZi_Skin_UIAsset7_i()];
			return temp;
		}

		private function __ZhanChangRiZi_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 353;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 8;
			temp.y = 38;
			return temp;
		}

		private function __ZhanChangRiZi_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 399;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhanChangRiZi_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/paiming.png";
			temp.x = 23;
			temp.y = 7;
			return temp;
		}

		private function __ZhanChangRiZi_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/mingzi.png";
			temp.x = 98;
			temp.y = 7;
			return temp;
		}

		private function __ZhanChangRiZi_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/zuigaocengshu.png";
			temp.x = 187;
			temp.y = 7;
			return temp;
		}

		private function __ZhanChangRiZi_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/jisha.png";
			temp.x = 281;
			temp.y = 7;
			return temp;
		}

		private function __ZhanChangRiZi_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/jifen.png";
			temp.x = 348;
			temp.y = 7;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 437;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 421;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 386;
			temp.y = 7;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.common.Flip3_Skin()
			temp.skin = skin
			temp.width = 160;
			temp.x = 131;
			temp.y = 397;
			return temp;
		}

		private function title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			title = temp;
			temp.name = "title";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/zhanchang/jiucengyaota/zhanchangrizhi.png";
			temp.x = 165;
			temp.y = 6;
			return temp;
		}

		private function uiNo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNo = temp;
			temp.name = "uiNo";
			temp.styleName = "ui/app/zhanchang/jiucengyaota/zanwujilv.png";
			temp.x = 162;
			temp.y = 206.5;
			return temp;
		}

	}
}