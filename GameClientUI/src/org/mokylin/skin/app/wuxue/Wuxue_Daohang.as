package org.mokylin.skin.app.wuxue
{
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.wuxue.button.ButtonJineng;
	import org.mokylin.skin.app.wuxue.button.ButtonJuexue;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Wuxue_Daohang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_jineng:feathers.controls.Radio;

		public var btn_juexue:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Wuxue_Daohang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 285;
			this.elementsContent = [btn_jineng_i(),btn_juexue_i()];
			
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
			temp.groupName = "rdoWuxue";
			temp.styleClass = org.mokylin.skin.app.wuxue.button.ButtonJineng;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_juexue_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_juexue = temp;
			temp.name = "btn_juexue";
			temp.groupName = "rdoWuxue";
			temp.styleClass = org.mokylin.skin.app.wuxue.button.ButtonJuexue;
			temp.x = 144;
			temp.y = 0;
			return temp;
		}

	}
}