package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownJinWeiListPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownJinWeiListPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 475;
			this.width = 665;
			labelFilterBlack_i();
			this.elementsContent = [__CrownJinWeiListPanelSkin_UIAsset1_i(),__CrownJinWeiListPanelSkin_UIAsset2_i(),__CrownJinWeiListPanelSkin_Label1_i(),__CrownJinWeiListPanelSkin_UIAsset3_i(),__CrownJinWeiListPanelSkin_Label2_i(),__CrownJinWeiListPanelSkin_Label3_i(),__CrownJinWeiListPanelSkin_Label4_i(),__CrownJinWeiListPanelSkin_Label5_i(),__CrownJinWeiListPanelSkin_Label6_i(),__CrownJinWeiListPanelSkin_Label7_i(),list_i(),closeBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownJinWeiListPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 18;
			temp.text = "禁卫军审批";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.verticalAlign = "middle";
			temp.width = 141;
			temp.x = 265;
			temp.y = 5;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "玩家名称";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.verticalAlign = "middle";
			temp.width = 130;
			temp.x = 7;
			temp.y = 35;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "所在家族";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.verticalAlign = "middle";
			temp.width = 124;
			temp.x = 128;
			temp.y = 35;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.verticalAlign = "middle";
			temp.width = 82;
			temp.x = 241;
			temp.y = 35;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "战斗力";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.verticalAlign = "middle";
			temp.width = 82;
			temp.x = 332;
			temp.y = 35;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "在线状态";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.verticalAlign = "middle";
			temp.width = 82;
			temp.x = 444;
			temp.y = 35;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xC9B48A;
			temp.verticalAlign = "middle";
			temp.width = 82;
			temp.x = 537;
			temp.y = 35;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 475;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 665;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 523;
			temp.x = 74;
			temp.y = 7;
			return temp;
		}

		private function __CrownJinWeiListPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/liebiao.png";
			temp.width = 633;
			temp.x = 16;
			temp.y = 36;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 626;
			temp.y = 4;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 407;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.EquipListSkin);
			temp.width = 647;
			temp.x = 8;
			temp.y = 61;
			return temp;
		}

	}
}