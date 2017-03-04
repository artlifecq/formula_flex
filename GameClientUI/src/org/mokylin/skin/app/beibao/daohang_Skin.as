package org.mokylin.skin.app.beibao
{
	import feathers.controls.Group;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.beibao.button.ButtonJineng;
	import org.mokylin.skin.app.beibao.button.ButtonJuese;

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
		public var btn_jineng:feathers.controls.Radio;

		public var btn_juese:feathers.controls.Radio;

		public var btn_nv:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function daohang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 285;
			this.elementsContent = [btn_nv_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_jineng_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_jineng = temp;
			temp.name = "btn_jineng";
			temp.groupName = "rdoBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonJineng;
			temp.x = 144;
			temp.y = 0;
			return temp;
		}

		private function btn_juese_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_juese = temp;
			temp.name = "btn_juese";
			temp.groupName = "rdoBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonJuese;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_nv_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btn_nv = temp;
			temp.name = "btn_nv";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [btn_juese_i(),btn_jineng_i()];
			return temp;
		}

	}
}