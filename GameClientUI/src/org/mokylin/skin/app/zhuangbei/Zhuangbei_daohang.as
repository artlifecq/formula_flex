package org.mokylin.skin.app.zhuangbei
{
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhuangbei.button.ButtonQianghua;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhuangbei_daohang extends feathers.controls.StateSkin
	{
		public var btn_jineng:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuangbei_daohang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 141;
			this.elementsContent = [btn_jineng_i()];
			
			states = {
			};
			skinNames={};
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

	}
}