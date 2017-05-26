package org.mokylin.skin.app.fuben
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.fuben.uinumber.UINumberDaojishi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_Exit extends feathers.controls.StateSkin
	{
		public var numTime:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_Exit()
		{
			super();
			
			this.currentState = "normal";
			this.height = 94;
			this.width = 694;
			this.elementsContent = [__FuBen_Exit_UIAsset1_i(),__FuBen_Exit_UIAsset2_i(),__FuBen_Exit_UIAsset3_i(),numTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_Exit_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/wenzibg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_Exit_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/tiaozhanchenggong.png";
			temp.x = 173;
			temp.y = 29;
			return temp;
		}

		private function __FuBen_Exit_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/miaohouguanbifuben.png";
			temp.x = 369;
			temp.y = 29;
			return temp;
		}

		private function numTime_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numTime = temp;
			temp.name = "numTime";
			temp.gap = -1;
			temp.height = 38;
			temp.label = "30";
			temp.styleClass = org.mokylin.skin.app.fuben.uinumber.UINumberDaojishi;
			temp.textAlign = "right";
			temp.width = 56;
			temp.x = 313;
			temp.y = 27;
			return temp;
		}

	}
}