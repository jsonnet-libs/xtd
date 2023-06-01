local array = import '../array.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

test.new(std.thisFile)

+ test.case.new(
  name='first two',
  test=test.expect.eq(
    actual=array.slice(
      ['content1', 'content2', 'content3'],
      index=0,
      end=2,
    ),
    expected=['content1', 'content2'],
  )
)
+ test.case.new(
  name='last two',
  test=test.expect.eq(
    actual=array.slice(
      ['content1', 'content2', 'content3'],
      index=1,
      end=3,
    ),
    expected=['content2', 'content3'],
  )
)
+ test.case.new(
  name='until end',
  test=test.expect.eq(
    actual=array.slice(
      ['content1', 'content2', 'content3'],
      index=1
    ),
    expected=['content2', 'content3'],
  )
)
+ test.case.new(
  name='from beginning',
  test=test.expect.eq(
    actual=array.slice(
      ['content1', 'content2', 'content3'],
      index=0,
      end=2
    ),
    expected=['content1', 'content2'],
  )
)
+ test.case.new(
  name='negative start',
  test=test.expect.eq(
    actual=array.slice(
      ['content1', 'content2', 'content3'],
      index=-2
    ),
    expected=['content2', 'content3'],
  )
)
+ test.case.new(
  name='negative end',
  test=test.expect.eq(
    actual=array.slice(
      ['content1', 'content2', 'content3'],
      index=0,
      end=-1
    ),
    expected=['content1', 'content2'],
  )
)
+ test.case.new(
  name='step',
  test=test.expect.eq(
    actual=array.slice(
      [
        'content%s' % i
        for i in std.range(1, 10)
      ],
      index=0,
      end=5,
      step=2
    ),
    expected=['content1', 'content3', 'content5'],
  )
)
