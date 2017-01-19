package org.mokylin.skin.mainui.navigation
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class navigation_nv_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_n0:feathers.controls.Button;

		public var btn_n1:feathers.controls.Button;

		public var btn_n2:feathers.controls.Button;

		public var btn_over:feathers.controls.UIAsset;

		public var lbl0:feathers.controls.Label;

		public var lbl1:feathers.controls.Label;

		public var lbl2:feathers.controls.Label;

		public var nv_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function navigation_nv_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 86;
			this.width = 57;
			this.elementsContent = [nv_bg_i(),btn_over_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_over_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			btn_over = temp;
			temp.name = "btn_over";
			temp.styleName = "ui/mainui/navigation/zhishi.png";
			temp.width = 52;
			temp.x = 3;
			temp.y = 54;
			return temp;
		}

		private function nv_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nv_bg = temp;
			temp.name = "nv_bg";
			temp.bottom = 0;
			temp.styleName = "ui/mainui/navigation/di.png";
			temp.top = 0;
			temp.x = 0;
			return temp;
		}

	}
}