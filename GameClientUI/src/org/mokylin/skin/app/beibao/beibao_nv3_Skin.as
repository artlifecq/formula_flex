package org.mokylin.skin.app.beibao
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.beibao.button.Btn_shuxing3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class beibao_nv3_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn0:feathers.controls.Button;

		public var btn1:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function beibao_nv3_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btn0_i(),btn1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn0 = temp;
			temp.name = "btn0";
			temp.styleClass = org.mokylin.skin.app.beibao.button.Btn_shuxing3;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn1 = temp;
			temp.name = "btn1";
			temp.styleClass = org.mokylin.skin.app.beibao.button.Btn_shuxing3;
			temp.x = 133;
			temp.y = 0;
			return temp;
		}

	}
}