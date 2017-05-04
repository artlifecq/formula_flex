package org.mokylin.skin.app.beibao
{
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.beibao.button.ButtonJingmai;
	import org.mokylin.skin.app.beibao.button.ButtonJuese;
	import org.mokylin.skin.app.beibao.button.ButtonXinfa;
	import org.mokylin.skin.app.beibao.button.ButtonZhangong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class daohang_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_jingmai:feathers.controls.Radio;

		public var btn_juese:feathers.controls.Radio;

		public var btn_xinfa:feathers.controls.Radio;

		public var btn_zhangong:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function daohang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.elementsContent = [btn_juese_i(),btn_jingmai_i(),btn_xinfa_i(),btn_zhangong_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_jingmai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_jingmai = temp;
			temp.name = "btn_jingmai";
			temp.groupName = "rdoJuese";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonJingmai;
			temp.x = 143;
			temp.y = 0;
			return temp;
		}

		private function btn_juese_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_juese = temp;
			temp.name = "btn_juese";
			temp.groupName = "rdoJuese";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonJuese;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_xinfa_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_xinfa = temp;
			temp.name = "btn_xinfa";
			temp.groupName = "rdoJuese";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonXinfa;
			temp.x = 286;
			temp.y = 0;
			return temp;
		}

		private function btn_zhangong_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_zhangong = temp;
			temp.name = "btn_zhangong";
			temp.groupName = "rdoJuese";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonZhangong;
			temp.x = 428;
			temp.y = 0;
			return temp;
		}

	}
}