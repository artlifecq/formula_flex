package org.mokylin.skin.app.zhuangbei
{
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhuangbei.button.ButtonHecheng;
	import org.mokylin.skin.app.zhuangbei.button.ButtonJicheng;
	import org.mokylin.skin.app.zhuangbei.button.ButtonQianghua;
	import org.mokylin.skin.app.zhuangbei.button.ButtonXilian;
	import org.mokylin.skin.app.zhuangbei.button.ButtonZuomo;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhuangbei_daohang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_hecheng:feathers.controls.Radio;

		public var btn_jicheng:feathers.controls.Radio;

		public var btn_jineng:feathers.controls.Radio;

		public var btn_xilian:feathers.controls.Radio;

		public var btn_zuomo:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuangbei_daohang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.elementsContent = [btn_jineng_i(),btn_zuomo_i(),btn_xilian_i(),btn_jicheng_i(),btn_hecheng_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_hecheng_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_hecheng = temp;
			temp.name = "btn_hecheng";
			temp.groupName = "rdoBtn";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.button.ButtonHecheng;
			temp.x = 576;
			temp.y = 0;
			return temp;
		}

		private function btn_jicheng_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_jicheng = temp;
			temp.name = "btn_jicheng";
			temp.groupName = "rdoBtn";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.button.ButtonJicheng;
			temp.x = 432;
			temp.y = 0;
			return temp;
		}

		private function btn_jineng_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_jineng = temp;
			temp.name = "btn_jineng";
			temp.groupName = "rdoBtn";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.button.ButtonQianghua;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_xilian_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_xilian = temp;
			temp.name = "btn_xilian";
			temp.groupName = "rdoBtn";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.button.ButtonXilian;
			temp.x = 288;
			temp.y = 0;
			return temp;
		}

		private function btn_zuomo_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_zuomo = temp;
			temp.name = "btn_zuomo";
			temp.groupName = "rdoBtn";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.button.ButtonZuomo;
			temp.x = 144;
			temp.y = 0;
			return temp;
		}

	}
}