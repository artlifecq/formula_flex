package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumkuafu;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class KuaFuVs_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var lbPiPei:feathers.controls.Label;

		public var numTime:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function KuaFuVs_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 166;
			this.width = 405;
			this.elementsContent = [__KuaFuVs_Skin_UIAsset1_i(),numTime_i(),lbPiPei_i(),btnClose_i(),btnCancel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __KuaFuVs_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/kuafu_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取消匹配";
			temp.letterSpacing = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.textAlign = "center";
			temp.width = 111;
			temp.x = 152;
			temp.y = 136;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 329;
			temp.y = 14;
			return temp;
		}

		private function lbPiPei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPiPei = temp;
			temp.name = "lbPiPei";
			temp.fontSize = 16;
			temp.text = "正在匹配中...";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 160;
			temp.y = 108;
			return temp;
		}

		private function numTime_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numTime = temp;
			temp.name = "numTime";
			temp.gap = -6;
			temp.height = 60;
			temp.label = "60";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumkuafu;
			temp.width = 102;
			temp.x = 158;
			temp.y = 45;
			return temp;
		}

	}
}