package org.mokylin.skin.app.tequan
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
	public class Item_Meirilibao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var bg1:feathers.controls.UIAsset;

		public var btnOk:feathers.controls.Button;

		public var gLevel:feathers.controls.Group;

		public var gTilte:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var lbVip:feathers.controls.Label;

		public var uiHead:feathers.controls.UIAsset;

		public var uiHead0:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Item_Meirilibao()
		{
			super();
			
			this.currentState = "normal";
			this.height = 72;
			this.width = 684;
			this.elementsContent = [bg1_i(),gTilte_i(),gLevel_i(),btnOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.styleName = "ui/app/tequan/37_1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.styleName = "ui/app/tequan/kuang_wupomo.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领 取";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 112;
			temp.x = 543;
			temp.y = 16;
			return temp;
		}

		private function gLevel_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gLevel = temp;
			temp.name = "gLevel";
			temp.x = 29;
			temp.y = 5;
			temp.elementsContent = [lbVip_i(),Icon_i(),icon1_i()];
			return temp;
		}

		private function gTilte_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gTilte = temp;
			temp.name = "gTilte";
			temp.x = 5;
			temp.y = 28;
			temp.elementsContent = [uiHead_i(),uiHead0_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 139;
			temp.y = 3;
			return temp;
		}

		private function lbVip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbVip = temp;
			temp.name = "lbVip";
			temp.text = "37平台vip等级达到V1即可领取";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 458;
			temp.y = 47;
			return temp;
		}

		private function uiHead0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead0 = temp;
			temp.name = "uiHead0";
			temp.styleName = "ui/app/tequan/chenghao/37_v0.png";
			temp.x = 226;
			temp.y = -23;
			return temp;
		}

		private function uiHead_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead = temp;
			temp.name = "uiHead";
			temp.styleName = "ui/app/tequan/37pingtaiVIP6.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}