package org.mokylin.skin.mainui.tishi
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class caiji_tiao extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function caiji_tiao()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 256;
			this.elementsContent = [__caiji_tiao_UIAsset1_i(),__caiji_tiao_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __caiji_tiao_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/tishi/jdt_tiao.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __caiji_tiao_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/tishi/jdt_guang.png";
			temp.x = 244;
			temp.y = 0;
			return temp;
		}

	}
}