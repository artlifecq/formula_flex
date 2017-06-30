package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianTiaoZhanPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var listItem:feathers.controls.List;

		public var title:feathers.controls.Label;

		public var uiWRB:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhanPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 555;
			this.elementsContent = [bg_i(),title_i(),listItem_i(),__JiXianTiaoZhanPaiHang_UIAsset1_i(),__JiXianTiaoZhanPaiHang_UIAsset2_i(),uiWRB_i(),grpIcon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianTiaoZhanPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/bg2.png";
			temp.x = 9;
			temp.y = 446;
			return temp;
		}

		private function __JiXianTiaoZhanPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/wodepaihangjiangli.png";
			temp.x = 75;
			temp.y = 457;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 560;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 338;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 44;
			temp.y = 486;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 64;
			temp.y = 0;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 129;
			temp.y = 0;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 193;
			temp.y = 0;
			return temp;
		}

		private function listItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listItem = temp;
			temp.name = "listItem";
			temp.height = 403;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 318;
			temp.x = 12;
			temp.y = 43;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "周排名奖励";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 49;
			temp.y = 11;
			return temp;
		}

		private function uiWRB_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWRB = temp;
			temp.name = "uiWRB";
			temp.styleName = "ui/app/activety/jixiantiaozhan/shangweirubangzaijiezaili.png";
			temp.x = 86;
			temp.y = 500;
			return temp;
		}

	}
}