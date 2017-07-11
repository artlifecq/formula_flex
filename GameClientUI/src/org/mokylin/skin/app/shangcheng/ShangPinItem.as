package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangPinItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBuy:feathers.controls.Button;

		public var grpJiage:feathers.controls.Group;

		public var grpJiage2:feathers.controls.Group;

		public var icons:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var lbNowPrice:feathers.controls.Label;

		public var lbXiangou:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var lbYuanbao2:feathers.controls.Label;

		public var uiLine:feathers.controls.UIAsset;

		public var uiYuanbao:feathers.controls.UIAsset;

		public var uiYuanbao2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangPinItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 124;
			this.width = 210;
			this.elementsContent = [__ShangPinItem_UIAsset1_i(),icons_i(),lbName_i(),lbXiangou_i(),grpJiage_i(),grpJiage2_i(),btnBuy_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShangPinItem_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "售价：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __ShangPinItem_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shangcheng/kuai.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBuy_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBuy = temp;
			temp.name = "btnBuy";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "购 买";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 110;
			temp.x = 91;
			temp.y = 84;
			return temp;
		}

		private function grpJiage2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpJiage2 = temp;
			temp.name = "grpJiage2";
			temp.x = 91;
			temp.y = 40;
			temp.elementsContent = [lbNowPrice_i(),uiYuanbao2_i(),lbYuanbao2_i()];
			return temp;
		}

		private function grpJiage_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpJiage = temp;
			temp.name = "grpJiage";
			temp.x = 91;
			temp.y = 40;
			temp.elementsContent = [__ShangPinItem_Label1_i(),uiYuanbao_i(),lbYuanbao_i(),uiLine_i()];
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.height = 72;
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.width = 72;
			temp.x = 9;
			temp.y = 36;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.bold = false;
			temp.text = "装备名字六字";
			temp.textAlign = "center";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 151;
			temp.x = 35;
			temp.y = 6;
			return temp;
		}

		private function lbNowPrice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNowPrice = temp;
			temp.name = "lbNowPrice";
			temp.text = "售价：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function lbXiangou_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiangou = temp;
			temp.name = "lbXiangou";
			temp.text = "每日限购： 0/10";
			temp.color = 0x2083B9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 91;
			temp.y = 66;
			return temp;
		}

		private function lbYuanbao2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao2 = temp;
			temp.name = "lbYuanbao2";
			temp.text = "750";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 46;
			temp.x = 66;
			temp.y = 4;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "750";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 46;
			temp.x = 66;
			temp.y = 4;
			return temp;
		}

		private function uiLine_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLine = temp;
			temp.name = "uiLine";
			temp.styleName = "ui/app/shangcheng/xian.png";
			temp.x = 42;
			temp.y = 12;
			return temp;
		}

		private function uiYuanbao2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYuanbao2 = temp;
			temp.name = "uiYuanbao2";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

		private function uiYuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYuanbao = temp;
			temp.name = "uiYuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

	}
}