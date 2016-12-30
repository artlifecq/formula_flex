package org.mokylin.skin.app.beibao.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class btn_shuxing_select extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function btn_shuxing_select()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__btn_shuxing_select_UIAsset1_i(),__btn_shuxing_select_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __btn_shuxing_select_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/button/btn_juese/select.png";
			return temp;
		}

		private function __btn_shuxing_select_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/btntext/btnText2_1.png";
			temp.x = 37;
			temp.y = 9;
			return temp;
		}

	}
}