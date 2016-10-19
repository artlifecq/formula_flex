package org.mokylin.skin.app.rank
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BossHurtRankPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bottomGroup:feathers.controls.Group;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var list:feathers.controls.List;

		public var myHurtTxt:feathers.controls.Label;

		public var myRankTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BossHurtRankPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 360;
			this.width = 320;
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),__BossHurtRankPanelSkin_UIAsset1_i(),__BossHurtRankPanelSkin_Label1_i(),bottomGroup_i(),list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BossHurtRankPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 16;
			temp.text = "伤害排行榜";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 62;
			temp.y = 1;
			return temp;
		}

		private function __BossHurtRankPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/kang/xiaotaitou.png";
			temp.width = 300;
			temp.x = 10;
			temp.y = 2;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 360;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 320;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bottomGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bottomGroup = temp;
			temp.name = "bottomGroup";
			temp.height = 24;
			temp.width = 299;
			temp.x = 11;
			temp.y = 334;
			temp.elementsContent = [myHurtTxt_i(),myRankTxt_i()];
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 4;
			temp.blurY = 4;
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
			temp.height = 300;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin3);
			temp.width = 300;
			temp.x = 9;
			temp.y = 28;
			return temp;
		}

		private function myHurtTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myHurtTxt = temp;
			temp.name = "myHurtTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "我的伤害：9999";
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 170;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function myRankTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myRankTxt = temp;
			temp.name = "myRankTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "我的排名：11";
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 179;
			temp.y = 0;
			return temp;
		}

	}
}