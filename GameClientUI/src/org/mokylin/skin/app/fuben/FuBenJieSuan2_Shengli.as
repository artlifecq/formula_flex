package org.mokylin.skin.app.fuben
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
	public class FuBenJieSuan2_Shengli extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnEixt:feathers.controls.Button;

		public var icon1:feathers.controls.UIAsset;

		public var lbTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBenJieSuan2_Shengli()
		{
			super();
			
			this.currentState = "normal";
			this.height = 347;
			this.width = 469;
			this.elementsContent = [__FuBenJieSuan2_Shengli_UIAsset1_i(),__FuBenJieSuan2_Shengli_UIAsset2_i(),icon1_i(),btnEixt_i(),lbTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBenJieSuan2_Shengli_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 196;
			temp.styleName = "ui/app/fuben/fubenjiesuan/bg.png";
			temp.x = 0;
			temp.y = 151;
			return temp;
		}

		private function __FuBenJieSuan2_Shengli_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/fubenjiesuan/tiaozhanshengli.png";
			temp.x = 61;
			temp.y = 0;
			return temp;
		}

		private function btnEixt_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnEixt = temp;
			temp.name = "btnEixt";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出副本";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 177;
			temp.y = 275;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/60.png";
			temp.x = 199;
			temp.y = 197;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "10秒自动领取奖励";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 165;
			temp.y = 308;
			return temp;
		}

	}
}