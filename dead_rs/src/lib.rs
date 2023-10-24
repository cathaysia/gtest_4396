#[no_mangle]
pub extern "C" fn test_assert(val: u32) {
    assert!(val > 20);
}
