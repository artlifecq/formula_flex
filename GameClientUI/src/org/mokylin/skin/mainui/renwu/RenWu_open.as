package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RenWu_open extends feathers.controls.StateSkin
	{
		public var btn_open:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWu_open()
		{
			super();
			
			this.currentState = "normal";
			this.height = 108;
			this.width = 20;
			this.elementsContent = [__RenWu_open_UIAsset1_i(),btn_open_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenWu_open_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/rwzz_shu.png";
			temp.x = 0;
			temp.y = 7;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}