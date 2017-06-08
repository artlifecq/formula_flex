package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ProSkill_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnUp:feathers.controls.Button;

		public var grpHide:feathers.controls.Group;

		public var icon:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var lbNextXiaguo:feathers.controls.Label;

		public var lbTips:feathers.controls.Label;

		public var lbXiaoguo:feathers.controls.Label;

		public var lbXiaohao:feathers.controls.Label;

		public var uiName:feathers.controls.UIAsset;

		public var uiOk:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ProSkill_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 230;
			this.width = 257;
			this.elementsContent = [__ProSkill_Item_UIAsset1_i(),icon_i(),uiName_i(),lbLevel_i(),__ProSkill_Item_Label1_i(),__ProSkill_Item_UIAsset2_i(),lbXiaoguo_i(),grpHide_i(),btnUp_i(),uiOk_i(),lbTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ProSkill_Item_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前效果：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 32;
			temp.y = 93;
			return temp;
		}

		private function __ProSkill_Item_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "下级效果：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __ProSkill_Item_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "升级消耗：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 23;
			return temp;
		}

		private function __ProSkill_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jinengbg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ProSkill_Item_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jinengdikuang.png";
			temp.x = 104;
			temp.y = 92;
			return temp;
		}

		private function __ProSkill_Item_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jinengdikuang.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __ProSkill_Item_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jinengdikuang.png";
			temp.x = 72;
			temp.y = 22;
			return temp;
		}

		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "升级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.x = 92;
			temp.y = 181;
			return temp;
		}

		private function grpHide_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpHide = temp;
			temp.name = "grpHide";
			temp.x = 32;
			temp.y = 114;
			temp.elementsContent = [__ProSkill_Item_Label2_i(),__ProSkill_Item_Label3_i(),__ProSkill_Item_UIAsset3_i(),__ProSkill_Item_UIAsset4_i(),lbNextXiaguo_i(),lbXiaohao_i()];
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/banghui/tubiaokuang.png";
			temp.x = 26;
			temp.y = 14;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.letterSpacing = 1;
			temp.text = "等级0/10";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 84;
			temp.x = 113;
			temp.y = 58;
			return temp;
		}

		private function lbNextXiaguo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNextXiaguo = temp;
			temp.name = "lbNextXiaguo";
			temp.text = "攻击 +100";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 113;
			temp.x = 78;
			temp.y = 1;
			return temp;
		}

		private function lbTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTips = temp;
			temp.name = "lbTips";
			temp.text = "请加入帮会";
			temp.textAlign = "center";
			temp.color = 0xFF0000;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 208;
			temp.x = 24;
			temp.y = 186;
			return temp;
		}

		private function lbXiaoguo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaoguo = temp;
			temp.name = "lbXiaoguo";
			temp.text = "未提升";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 113;
			temp.x = 110;
			temp.y = 93;
			return temp;
		}

		private function lbXiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaohao = temp;
			temp.name = "lbXiaohao";
			temp.text = "帮贡900/9999";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 113;
			temp.x = 78;
			temp.y = 23;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/banghui/word/gongjijiaqiang.png";
			temp.x = 111;
			temp.y = 21;
			return temp;
		}

		private function uiOk_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOk = temp;
			temp.name = "uiOk";
			temp.styleName = "ui/app/banghui/yimanji.png";
			temp.x = 61;
			temp.y = 117;
			return temp;
		}

	}
}