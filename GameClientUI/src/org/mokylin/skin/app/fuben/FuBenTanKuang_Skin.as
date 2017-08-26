package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.fuben.ListItem_Skin;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBenTanKuang_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var lbName:feathers.controls.Label;

		public var lbOk:feathers.controls.Label;

		public var lbTips:feathers.controls.Label;

		public var skinRole0:feathers.controls.SkinnableContainer;

		public var skinRole1:feathers.controls.SkinnableContainer;

		public var skinRole2:feathers.controls.SkinnableContainer;

		public var skinRole3:feathers.controls.SkinnableContainer;

		public var skinRole4:feathers.controls.SkinnableContainer;

		public var teaminfo:feathers.controls.Label;

		public var uiFubenName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBenTanKuang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 314;
			this.width = 331;
			this.elementsContent = [bg_i(),btnClose_i(),btnOk_i(),btnCancel_i(),teaminfo_i(),__FuBenTanKuang_Skin_Label1_i(),uiFubenName_i(),__FuBenTanKuang_Skin_UIAsset2_i(),lbTips_i(),skinRole1_i(),skinRole2_i(),skinRole3_i(),skinRole4_i(),skinRole0_i(),__FuBenTanKuang_Skin_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBenTanKuang_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "——";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 98;
			temp.y = 85;
			return temp;
		}

		private function __FuBenTanKuang_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 37;
			temp.y = 114;
			return temp;
		}

		private function __FuBenTanKuang_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/head_tishi.png";
			temp.x = 142;
			temp.y = 9;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 314;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拒 绝";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 187;
			temp.y = 267;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 297;
			temp.y = 7;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "同 意";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 56;
			temp.y = 267;
			return temp;
		}

		private function lbTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTips = temp;
			temp.name = "lbTips";
			temp.fontSize = 14;
			temp.text = "请等待所有队员同意，同意后将开始副本匹配";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.visible = false;
			temp.width = 292;
			temp.x = 18;
			temp.y = 276;
			return temp;
		}

		private function skinRole0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole0 = temp;
			temp.name = "skinRole0";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.fuben.ListItem_Skin()
			temp.skin = skin
			temp.width = 263;
			temp.x = 49;
			temp.y = 130;
			return temp;
		}

		private function skinRole1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole1 = temp;
			temp.name = "skinRole1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.fuben.ListItem_Skin()
			temp.skin = skin
			temp.width = 263;
			temp.x = 49;
			temp.y = 155;
			return temp;
		}

		private function skinRole2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole2 = temp;
			temp.name = "skinRole2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.fuben.ListItem_Skin()
			temp.skin = skin
			temp.width = 263;
			temp.x = 49;
			temp.y = 180;
			return temp;
		}

		private function skinRole3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole3 = temp;
			temp.name = "skinRole3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.fuben.ListItem_Skin()
			temp.skin = skin
			temp.width = 263;
			temp.x = 49;
			temp.y = 205;
			return temp;
		}

		private function skinRole4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole4 = temp;
			temp.name = "skinRole4";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.fuben.ListItem_Skin()
			temp.skin = skin
			temp.width = 263;
			temp.x = 49;
			temp.y = 230;
			return temp;
		}

		private function teaminfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			teaminfo = temp;
			temp.name = "teaminfo";
			temp.fontSize = 16;
			temp.text = "队长正在申请进入跨服副本";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 61;
			temp.y = 55;
			return temp;
		}

		private function uiFubenName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFubenName = temp;
			temp.name = "uiFubenName";
			temp.x = 137;
			temp.y = 79;
			return temp;
		}

	}
}