package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberTiaozhantuichu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TiaoZhan_Exit extends feathers.controls.StateSkin
	{
		public var num:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TiaoZhan_Exit()
		{
			super();
			
			this.currentState = "normal";
			this.height = 56;
			this.width = 265;
			this.elementsContent = [__TiaoZhan_Exit_UIAsset1_i(),__TiaoZhan_Exit_UIAsset2_i(),num_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TiaoZhan_Exit_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/activety/jixiantiaozhan/paihangdi.png";
			temp.width = 244;
			temp.x = 8;
			temp.y = 0;
			return temp;
		}

		private function __TiaoZhan_Exit_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/qingjingkuaishiquwupin.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function num_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num = temp;
			temp.name = "num";
			temp.height = 25;
			temp.label = "5";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberTiaozhantuichu;
			temp.width = 50;
			temp.x = 122;
			temp.y = 31;
			return temp;
		}

	}
}