package org.mokylin.skin.common.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.gezi_grid.grid_42_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class kechuandaiTip_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icons:feathers.controls.SkinnableContainer;

		public var lbl_name:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function kechuandaiTip_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 168;
			this.width = 208;
			this.elementsContent = [__kechuandaiTip_Skin_UIAsset1_i(),__kechuandaiTip_Skin_UIAsset2_i(),lbl_title_i(),__kechuandaiTip_Skin_UIAsset3_i(),icons_i(),lbl_name_i(),__kechuandaiTip_Skin_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __kechuandaiTip_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "无";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 99;
			temp.y = 119;
			return temp;
		}

		private function __kechuandaiTip_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 168;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 208;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __kechuandaiTip_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.styleName = "ui/common/tips/tips_2fengexian.png";
			temp.width = 203;
			temp.x = 3;
			temp.y = 29;
			return temp;
		}

		private function __kechuandaiTip_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 60;
			temp.styleName = "ui/common/tips/tips_zhuangbei_bg.png";
			temp.width = 191;
			temp.x = 9;
			temp.y = 37;
			return temp;
		}

		private function icons_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icons = temp;
			temp.name = "icons";
			temp.height = 54;
			var skin:StateSkin = new org.mokylin.skin.common.gezi_grid.grid_42_Skin()
			temp.skin = skin
			temp.width = 55;
			temp.x = 12;
			temp.y = 41;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.text = "装备名字";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 53;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "可穿戴设备";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 61;
			temp.y = 3;
			return temp;
		}

	}
}