package org.mokylin.skin.app.vip
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VipLevels extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumYuanbao:feathers.controls.UINumber;

		public var btnGoumai:feathers.controls.Button;

		public var imgPoint:feathers.controls.UIAsset;

		public var lbFY:feathers.controls.Label;

		public var lbGJ:feathers.controls.Label;

		public var lbSM:feathers.controls.Label;

		public var uiName:feathers.controls.UIAsset;

		public var uiOver:feathers.controls.UIAsset;

		public var uiSelect:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VipLevels()
		{
			super();
			
			this.currentState = "normal";
			this.height = 425;
			this.width = 237;
			this.elementsContent = [uiSelect_i(),uiOver_i(),uiName_i(),__VipLevels_UIAsset1_i(),__VipLevels_UIAsset2_i(),__VipLevels_UIAsset3_i(),lbSM_i(),lbGJ_i(),lbFY_i(),__VipLevels_UIAsset4_i(),NumYuanbao_i(),btnGoumai_i(),imgPoint_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function NumYuanbao_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumYuanbao = temp;
			temp.name = "NumYuanbao";
			temp.gap = -6;
			temp.height = 25;
			temp.label = "2800";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 123;
			temp.x = 98;
			temp.y = 331;
			return temp;
		}

		private function __VipLevels_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/xueliang.png";
			temp.x = 20;
			temp.y = 108;
			return temp;
		}

		private function __VipLevels_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/gongji.png";
			temp.x = 127;
			temp.y = 108;
			return temp;
		}

		private function __VipLevels_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/fangyu.png";
			temp.x = 20;
			temp.y = 129;
			return temp;
		}

		private function __VipLevels_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 68;
			temp.y = 331;
			return temp;
		}

		private function btnGoumai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGoumai = temp;
			temp.name = "btnGoumai";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "购 买";
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 75;
			temp.y = 372;
			return temp;
		}

		private function imgPoint_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgPoint = temp;
			temp.name = "imgPoint";
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 20;
			temp.y = 153;
			return temp;
		}

		private function lbFY_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFY = temp;
			temp.name = "lbFY";
			temp.text = "+300";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 62;
			temp.x = 65;
			temp.y = 129;
			return temp;
		}

		private function lbGJ_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGJ = temp;
			temp.name = "lbGJ";
			temp.text = "+450";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 62;
			temp.x = 170;
			temp.y = 108;
			return temp;
		}

		private function lbSM_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSM = temp;
			temp.name = "lbSM";
			temp.text = "+1875";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 64;
			temp.y = 108;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/vip/vip/baijinjika.png";
			temp.x = 35;
			temp.y = 5;
			return temp;
		}

		private function uiOver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOver = temp;
			temp.name = "uiOver";
			temp.height = 423;
			temp.styleName = "ui/app/vip/select/baijinkuang.png";
			temp.width = 237;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.height = 423;
			temp.styleName = "ui/app/vip/select/zhizunkuang.png";
			temp.width = 237;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

	}
}