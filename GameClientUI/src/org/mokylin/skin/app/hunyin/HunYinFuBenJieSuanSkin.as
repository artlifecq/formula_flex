package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HunYinFuBenJieSuanSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var icon1:feathers.controls.UIAsset;

		public var imgWin:feathers.controls.UIAsset;

		public var lbTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HunYinFuBenJieSuanSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 390;
			this.width = 469;
			this.elementsContent = [__HunYinFuBenJieSuanSkin_UIAsset1_i(),imgWin_i(),__HunYinFuBenJieSuanSkin_UIAsset2_i(),icon1_i(),btnOk_i(),lbTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HunYinFuBenJieSuanSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 245;
			temp.styleName = "ui/big_bg/activety/ban1.png";
			temp.width = 469;
			temp.x = 0;
			temp.y = 145;
			return temp;
		}

		private function __HunYinFuBenJieSuanSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tiaozhan.png";
			temp.x = 142;
			temp.y = 225;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "确 认";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 178;
			temp.y = 328;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 197;
			temp.y = 251;
			return temp;
		}

		private function imgWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgWin = temp;
			temp.name = "imgWin";
			temp.styleName = "ui/big_bg/activety/tianzhanshengli.png";
			temp.x = 52;
			temp.y = 0;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "7秒后自动关闭";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 292;
			temp.y = 337;
			return temp;
		}

	}
}