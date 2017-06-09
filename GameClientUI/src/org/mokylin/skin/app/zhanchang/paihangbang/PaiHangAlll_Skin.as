package org.mokylin.skin.app.zhanchang.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber3;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHangAlll_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var grpdi:feathers.controls.Group;

		public var imgDi:feathers.controls.UIAsset;

		public var imgMing:feathers.controls.UIAsset;

		public var listItem:feathers.controls.List;

		public var numZhanli:feathers.controls.UINumber;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHangAlll_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 555;
			this.elementsContent = [bg_i(),title_i(),listItem_i(),grpdi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHangAlll_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/bg2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangAlll_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/wodepaihang.png";
			temp.x = 67;
			temp.y = 11;
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

		private function grpdi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpdi = temp;
			temp.name = "grpdi";
			temp.x = 9;
			temp.y = 446;
			temp.elementsContent = [__PaiHangAlll_Skin_UIAsset1_i(),__PaiHangAlll_Skin_UIAsset2_i(),imgMing_i(),numZhanli_i(),imgDi_i()];
			return temp;
		}

		private function imgDi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgDi = temp;
			temp.name = "imgDi";
			temp.styleName = "ui/app/zhanchang/jingjichang/di2.png";
			temp.x = 98;
			temp.y = 47;
			return temp;
		}

		private function imgMing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMing = temp;
			temp.name = "imgMing";
			temp.styleName = "ui/app/zhanchang/jingjichang/ming2.png";
			temp.x = 196;
			temp.y = 47;
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

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = -2;
			temp.height = 25;
			temp.label = "2000";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber3;
			temp.width = 76;
			temp.x = 124;
			temp.y = 47;
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

	}
}