package org.mokylin.skin.app.vip
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.vip.button.ButtonZuanshi;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VipLevel2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnKaitong:feathers.controls.Button;

		public var btnVip:feathers.controls.Button;

		public var icon:feathers.controls.UIAsset;

		public var lbJiage:feathers.controls.Label;

		public var uiSelect:feathers.controls.UIAsset;

		public var uiVip:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VipLevel2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 94;
			this.width = 190;
			this.elementsContent = [btnVip_i(),icon_i(),uiVip_i(),__VipLevel2_UIAsset1_i(),lbJiage_i(),btnKaitong_i(),uiSelect_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __VipLevel2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 89;
			temp.y = 29;
			return temp;
		}

		private function btnKaitong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnKaitong = temp;
			temp.name = "btnKaitong";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "开 通";
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 91;
			temp.y = 54;
			return temp;
		}

		private function btnVip_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnVip = temp;
			temp.name = "btnVip";
			temp.styleClass = org.mokylin.skin.app.vip.button.ButtonZuanshi;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 10;
			temp.y = 34;
			return temp;
		}

		private function lbJiage_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJiage = temp;
			temp.name = "lbJiage";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "2000";
			temp.color = 0xEEEEEE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 58;
			temp.x = 117;
			temp.y = 33;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.height = 94;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/vip/select/zhizunkuang.png";
			temp.width = 190;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiVip_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiVip = temp;
			temp.name = "uiVip";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/vip/vip/zuanshi.png";
			temp.x = 15;
			temp.y = 39;
			return temp;
		}

	}
}