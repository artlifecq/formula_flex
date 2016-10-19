package org.mokylin.skin.app.mount.panel
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
	import org.mokylin.skin.component.list.ListSkin4;
	import org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountInheritSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnInherit:feathers.controls.Button;

		public var chekBoxGengu:feathers.controls.Check;

		public var chekBoxSpell:feathers.controls.Check;

		public var grid0:feathers.controls.UIAsset;

		public var gridList:feathers.controls.List;

		public var imgTips:feathers.controls.UIAsset;

		public var labBindSilver:feathers.controls.Label;

		public var labConsume:feathers.controls.Label;

		public var labGenGuExp:feathers.controls.Label;

		public var labGenGuExp1:feathers.controls.Label;

		public var labGenGuLevel:feathers.controls.Label;

		public var labGenGuLevel1:feathers.controls.Label;

		public var labGold:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var mainGrid1:feathers.controls.UIAsset;

		public var skillGrid0:feathers.controls.UIAsset;

		public var skillGrid1:feathers.controls.UIAsset;

		public var skillGrid2:feathers.controls.UIAsset;

		public var skillGrid3:feathers.controls.UIAsset;

		public var skillGrid4:feathers.controls.UIAsset;

		public var skillGrid5:feathers.controls.UIAsset;

		public var spellGrid0:feathers.controls.UIAsset;

		public var spellGrid1:feathers.controls.UIAsset;

		public var spellGrid2:feathers.controls.UIAsset;

		public var spellGrid3:feathers.controls.UIAsset;

		public var spellGrid4:feathers.controls.UIAsset;

		public var spellGrid5:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountInheritSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 575;
			this.width = 820;
			labelFilterBlack_i();
			this.elementsContent = [__MountInheritSkin_UIAsset1_i(),__MountInheritSkin_UIAsset2_i(),__MountInheritSkin_UIAsset3_i(),btnClose_i(),__MountInheritSkin_UIAsset4_i(),gridList_i(),mainGrid1_i(),grid0_i(),chekBoxGengu_i(),labGenGuExp_i(),labGenGuLevel_i(),labGenGuExp1_i(),labGenGuLevel1_i(),chekBoxSpell_i(),skillGrid0_i(),skillGrid1_i(),skillGrid2_i(),skillGrid3_i(),skillGrid4_i(),skillGrid5_i(),spellGrid0_i(),spellGrid1_i(),spellGrid2_i(),spellGrid3_i(),spellGrid4_i(),spellGrid5_i(),labConsume_i(),imgTips_i(),btnInherit_i(),labGold_i(),labBindSilver_i(),__MountInheritSkin_Label1_i(),__MountInheritSkin_Label2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountInheritSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 25;
			temp.fontSize = 14;
			temp.text = "拥有银两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 498;
			temp.y = 479;
			return temp;
		}

		private function __MountInheritSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "拥有绑银";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 498;
			temp.y = 508;
			return temp;
		}

		private function __MountInheritSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 3;
			temp.requestedColumnCount = 6;
			temp.requestedRowCount = 7;
			temp.verticalGap = 3;
			return temp;
		}

		private function __MountInheritSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 573;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 818;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MountInheritSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 738;
			temp.x = 27;
			temp.y = 4;
			return temp;
		}

		private function __MountInheritSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/mount/char/zuo_qi.png";
			temp.x = 359;
			temp.y = 8;
			return temp;
		}

		private function __MountInheritSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/img/chuan_cheng.jpg";
			temp.x = 80;
			temp.y = 36;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
			temp.x = 767;
			temp.y = 1;
			return temp;
		}

		private function btnInherit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnInherit = temp;
			temp.name = "btnInherit";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "开始传承";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xDDDABA;
			temp.x = 203;
			temp.y = 505;
			return temp;
		}

		private function chekBoxGengu_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chekBoxGengu = temp;
			temp.name = "chekBoxGengu";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 22;
			temp.label = "根骨经验传承";
			temp.styleClass = org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold;
			temp.color = 0xF09E01;
			temp.width = 115;
			temp.x = 100;
			temp.y = 189;
			return temp;
		}

		private function chekBoxSpell_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chekBoxSpell = temp;
			temp.name = "chekBoxSpell";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 22;
			temp.label = "坐骑技能传承";
			temp.styleClass = org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold;
			temp.color = 0xF09E01;
			temp.width = 115;
			temp.x = 100;
			temp.y = 268;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.height = 74;
			temp.width = 76;
			temp.x = 345;
			temp.y = 83;
			return temp;
		}

		private function gridList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			gridList = temp;
			temp.name = "gridList";
			temp.height = 415;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin4;
			temp.width = 293;
			temp.x = 493;
			temp.y = 50;
			temp.layout = __MountInheritSkin_TileLayout1_i();
			return temp;
		}

		private function imgTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTips = temp;
			temp.name = "imgTips";
			temp.styleName = "ui/common/icon/bangzhu.png";
			temp.x = 90;
			temp.y = 522;
			return temp;
		}

		private function labBindSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBindSilver = temp;
			temp.name = "labBindSilver";
			temp.height = 21;
			temp.text = "100锭50两9文";
			temp.textAlign = "left";
			temp.color = 0xC8B58B;
			temp.width = 170;
			temp.x = 564;
			temp.y = 507;
			return temp;
		}

		private function labConsume_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labConsume = temp;
			temp.name = "labConsume";
			temp.height = 20;
			temp.text = "本次消耗：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 204;
			temp.x = 183;
			temp.y = 472;
			return temp;
		}

		private function labGenGuExp1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGenGuExp1 = temp;
			temp.name = "labGenGuExp1";
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "xxxxx(+xxxxxx)";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 320;
			temp.y = 211;
			return temp;
		}

		private function labGenGuExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGenGuExp = temp;
			temp.name = "labGenGuExp";
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "根骨经验：xxxxxxxxx";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 125;
			temp.y = 211;
			return temp;
		}

		private function labGenGuLevel1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGenGuLevel1 = temp;
			temp.name = "labGenGuLevel1";
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "xx        (+xx)";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 320;
			temp.y = 236;
			return temp;
		}

		private function labGenGuLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGenGuLevel = temp;
			temp.name = "labGenGuLevel";
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "根骨等级：xxxxxxxxx";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 125;
			temp.y = 236;
			return temp;
		}

		private function labGold_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGold = temp;
			temp.name = "labGold";
			temp.height = 21;
			temp.text = "49999万9999";
			temp.textAlign = "left";
			temp.color = 0xC8B58B;
			temp.width = 170;
			temp.x = 564;
			temp.y = 478;
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

		private function mainGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mainGrid1 = temp;
			temp.name = "mainGrid1";
			temp.height = 74;
			temp.width = 76;
			temp.x = 128;
			temp.y = 83;
			return temp;
		}

		private function skillGrid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid0 = temp;
			temp.name = "skillGrid0";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 127;
			temp.y = 295;
			return temp;
		}

		private function skillGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid1 = temp;
			temp.name = "skillGrid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 127;
			temp.y = 349;
			return temp;
		}

		private function skillGrid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid2 = temp;
			temp.name = "skillGrid2";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 127;
			temp.y = 403;
			return temp;
		}

		private function skillGrid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid3 = temp;
			temp.name = "skillGrid3";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 187;
			temp.y = 294;
			return temp;
		}

		private function skillGrid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid4 = temp;
			temp.name = "skillGrid4";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 187;
			temp.y = 349;
			return temp;
		}

		private function skillGrid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid5 = temp;
			temp.name = "skillGrid5";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 187;
			temp.y = 403;
			return temp;
		}

		private function spellGrid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			spellGrid0 = temp;
			temp.name = "spellGrid0";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 329;
			temp.y = 295;
			return temp;
		}

		private function spellGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			spellGrid1 = temp;
			temp.name = "spellGrid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 329;
			temp.y = 349;
			return temp;
		}

		private function spellGrid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			spellGrid2 = temp;
			temp.name = "spellGrid2";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 329;
			temp.y = 403;
			return temp;
		}

		private function spellGrid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			spellGrid3 = temp;
			temp.name = "spellGrid3";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 389;
			temp.y = 294;
			return temp;
		}

		private function spellGrid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			spellGrid4 = temp;
			temp.name = "spellGrid4";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 389;
			temp.y = 349;
			return temp;
		}

		private function spellGrid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			spellGrid5 = temp;
			temp.name = "spellGrid5";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 389;
			temp.y = 403;
			return temp;
		}

	}
}