package org.mokylin.skin.app.openActivity
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.activityBar.button.ButtonRacing;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class OpenActivityBtnSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnBar:feathers.controls.Button;

		public var lbnum:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function OpenActivityBtnSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btnBar_i(),bg_i(),lbnum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/tubiao/yuandian.png";
			temp.x = 53;
			temp.y = 2;
			return temp;
		}

		private function btnBar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBar = temp;
			temp.name = "btnBar";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 75;
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonRacing;
			temp.color = 0xF9F0CC;
			temp.width = 75;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbnum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbnum = temp;
			temp.name = "lbnum";
			temp.height = 20;
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.text = "5";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 20;
			temp.x = 53;
			temp.y = 4;
			return temp;
		}

	}
}