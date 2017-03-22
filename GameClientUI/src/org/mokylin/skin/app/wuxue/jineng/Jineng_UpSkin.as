package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.wuxue.jineng.uinumber.UINumberShuzi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Jineng_UpSkin extends feathers.controls.StateSkin
	{
		public var num_zhandouli:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Jineng_UpSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 126;
			this.width = 430;
			this.elementsContent = [__Jineng_UpSkin_UIAsset1_i(),num_zhandouli_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Jineng_UpSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/jndjts.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function num_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_zhandouli = temp;
			temp.name = "num_zhandouli";
			temp.gap = -12;
			temp.height = 37;
			temp.label = "x35487";
			temp.styleClass = org.mokylin.skin.app.wuxue.jineng.uinumber.UINumberShuzi;
			temp.width = 206;
			temp.x = 224;
			temp.y = 43;
			return temp;
		}

	}
}